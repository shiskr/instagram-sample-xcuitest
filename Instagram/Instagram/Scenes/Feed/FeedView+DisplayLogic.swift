//
//  FeedViewController+DisplayLogic.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-01.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

protocol FeedDisplayLogic: AnyObject {
    func displayLoadingState()
    func displayNotLoadingState()

    func displayItems(viewModel: FeedModels.ItemsPresentation.ViewModel)

    func displayNoMoreItems(viewModel: FeedModels.NoMoreItemsPresentation.ViewModel)
    func displayRemoveNoMoreItems()

    func displayError(viewModel: FeedModels.ErrorPresentation.ViewModel)
    func displayRemoveError()
    
    func displaySuccessDidLike(viewModel: FeedModels.Like.ViewModel)
}

extension FeedView {
    class DisplayState: ObservableObject, FeedDisplayLogic {
        @Published var items: [FeedModels.DisplayedItem] = []
        @Published var isLoading: Bool = false
        
        @Published var noMoreItemsText: String = String()
        @Published var displayNoMoreItems: Bool = false
        
        @Published var error: String = String()
        @Published var displayError: Bool = false
         
        func displayLoadingState() {
            DispatchQueue.main.async {
                self.isLoading = true
            }
        }
        
        func displayNotLoadingState() {
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }

        func displayItems(viewModel: FeedModels.ItemsPresentation.ViewModel) {
            DispatchQueue.main.async {
                self.items = viewModel.items
            }
        }

        func displayNoMoreItems(viewModel: FeedModels.NoMoreItemsPresentation.ViewModel) {
            DispatchQueue.main.async {
                self.displayNoMoreItems = true
                self.noMoreItemsText = viewModel.text
            }
        }
        
        func displayRemoveNoMoreItems() {
            DispatchQueue.main.async {
                self.displayNoMoreItems = false
            }
        }

        func displayError(viewModel: FeedModels.ErrorPresentation.ViewModel) {
            DispatchQueue.main.async {
                self.displayError = true
                self.error = viewModel.text
            }
        }
        
        func displayRemoveError() {
            DispatchQueue.main.async {
                self.displayError = false
            }
        }
        
        func displaySuccessDidLike(viewModel: FeedModels.Like.ViewModel) {
            DispatchQueue.main.async {
                viewModel.item.likeCount = viewModel.likeCount
//                if let item = self.displayedItem(id: viewModel.item) {
////                    self.objectWillChange.send()
//                    item.likeCount = viewModel.likeCount
//                }
            }
        }
        
        func displayedItem(id: String) -> FeedModels.DisplayedItem? {
            return self.items.first(where: { $0.id == id })
        }
    }
}
