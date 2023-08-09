//
//  FeedView.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 01.08.2023.
//

import SwiftUI

struct FeedView: View {
    var interactor: FeedBusinessLogic?
    var router: FeedRoutingLogic?
    
    @ObservedObject var displayState = DisplayState()
    
    init() {
        let interactor = FeedInteractor()
        let presenter = FeedPresenter()
        let displayer = DisplayState()
        
        presenter.displayer = displayer
        interactor.presenter = presenter
        
        self.interactor = interactor
        self.displayState = displayer
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: ApplicationConstraints.constant.x32.rawValue) {
                    ForEach(self.displayState.items) { item in
                        FeedCell(item: item, delegate: self)
                    }
                }
                self.setupLoadingView()
                self.setupErrorText()
                self.setupNoMoreItems()
            }
            .navigationTitle(FeedLocalization.shared.title())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(FeedStyle.shared.navigationViewModel.instagramImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: ApplicationConstraints.constant.x100.rawValue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(FeedStyle.shared.navigationViewModel.messagerImage)
                        .imageScale(.large)
                }
            }
            .onAppear {
                self.interactor?.shouldFetchItems()
            }
        }
    }
    
    @ViewBuilder func setupLoadingView() -> some View {
        if self.displayState.isLoading {
            ProgressView()
                .modifier(FeedStyle.shared.progressViewModel.progressModifier())
        }
    }
    
    @ViewBuilder func setupErrorText() -> some View {
        if self.displayState.displayError {
            Button {
                self.interactor?.shouldFetchItems()
            } label: {
                Text(self.displayState.error)
                    .modifier(FeedStyle.shared.errorViewModel.titleModifier())
            }
            
        }
    }
    
    @ViewBuilder func setupNoMoreItems() -> some View {
        if self.displayState.displayNoMoreItems {
            Text(self.displayState.noMoreItemsText)
                .modifier(FeedStyle.shared.noMoreItemsViewModel.titleModifier())
        }
    }
}

extension FeedView: FeedCellDelegate {
    func feedCellDidTouchLike(cell: FeedCell?, item: FeedModels.DisplayedItem) {
        self.interactor?.shouldHandleLikeState(request: FeedModels.Like.Request(id: item.id))
    }
    
    func feedCellDidTouchComment(cell: FeedCell?, item: FeedModels.DisplayedItem) {
        
    }
    
    func feedCellDidTouchShare(cell: FeedCell?, item: FeedModels.DisplayedItem) {
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
