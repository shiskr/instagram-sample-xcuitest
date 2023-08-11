//
//  FeedPresenter.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-01.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

protocol FeedPresentationLogic {
    func presentLoadingState()
    func presentNotLoadingState()
    
    func presentItems(response: FeedModels.ItemsPresentation.Response)
    
    func presentNoMoreItems()
    func presentRemoveNoMoreItems()

    func presentError(response: FeedModels.ErrorPresentation.Response)
    func presentRemoveError()
    
    func presentLikeLoadingState(response: FeedModels.ItemLoadingState.Response)
    func presentSuccessDidSaveLike(response: FeedModels.Like.Response)
    func presentSuccessDidRemoveLike(response: FeedModels.Like.Response)
    
}

class FeedPresenter: FeedPresentationLogic {
    weak var displayer: FeedDisplayLogic?
    
    func presentLoadingState() {
        self.displayer?.displayLoadingState()
    }
    
    func presentNotLoadingState() {
        self.displayer?.displayNotLoadingState()
    }
    
    func presentItems(response: FeedModels.ItemsPresentation.Response) {
        self.displayer?.displayItems(viewModel: FeedModels.ItemsPresentation.ViewModel(items: self.displayedItems(posts: response.items)))
    }
    
    func presentNoMoreItems() {
        let text = FeedLocalization.shared.noMoreItemsText()
        self.displayer?.displayNoMoreItems(viewModel: FeedModels.NoMoreItemsPresentation.ViewModel(text: text))
    }
    
    func presentRemoveNoMoreItems() {
        self.displayer?.displayRemoveNoMoreItems()
    }
    
    func presentError(response: FeedModels.ErrorPresentation.Response) {
        let text = FeedLocalization.shared.errorText()
        let viewModel = FeedModels.ErrorPresentation.ViewModel(text: text)
        self.displayer?.displayError(viewModel: viewModel)
    }
    
    func presentRemoveError() {
        self.displayer?.displayRemoveError()
    }
    
    func presentLikeLoadingState(response: FeedModels.ItemLoadingState.Response) {
        self.displayer?.displayLikeLoadingState(viewModel: FeedModels.ItemLoadingState.ViewModel(id: response.id, isLoading: response.isLoading))
    }
    
    func presentSuccessDidSaveLike(response: FeedModels.Like.Response) {
        self.displayer?.displaySuccessDidSaveLike(viewModel: FeedModels.Like.ViewModel(id: response.id, likeCount: response.likeCount))
    }
    
    func presentSuccessDidRemoveLike(response: FeedModels.Like.Response) {
        self.displayer?.displaySuccessDidRemoveLike(viewModel: FeedModels.Like.ViewModel(id: response.id, likeCount: response.likeCount))
    }
    
    func displayedItems(posts: [Post]) -> [FeedModels.DisplayedItem] {
        return posts.map { post in
            self.displayedItem(post: post)
        }
    }
    
    func displayedItem(post: Post) -> FeedModels.DisplayedItem {
        let item = FeedModels.DisplayedItem(id: post.id)
        item.userImageUrl = post.user?.imageUrl
        item.userImagePlaceholder = FeedStyle.shared.cellViewModel.userPlaceholderImage
        item.postImageUrl = post.imageUrl
        item.postImagePlaceholder = FeedStyle.shared.cellViewModel.postPlaceholderImage
        item.username = post.user?.username
        item.caption = post.caption
        item.likeCount = post.likeCount
        item.timeAgo = post.createdAt.timeAgo()
        return item
    }
}
