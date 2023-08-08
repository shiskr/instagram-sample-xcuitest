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
    
    func presentSuccessDidLike(response: FeedModels.Like.Response)
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
    
    func presentSuccessDidLike(response: FeedModels.Like.Response) {
        self.displayer?.displaySuccessDidLike(viewModel: FeedModels.Like.ViewModel(item: response.item, likeCount: 20))
    }
    
    func displayedItems(posts: [Post]) -> [FeedModels.DisplayedItem] {
        return posts.map { post in
            self.displayedItem(post: post)
        }
    }
    
    func displayedItem(post: Post) -> FeedModels.DisplayedItem {
        let item = FeedModels.DisplayedItem(id: post.id)
        item.userImageUrl = post.user?.imageUrl
        item.userImagePlaceholder = ""
        item.postImageUrl = post.imageUrl
        item.postImagePlaceholder = ""
        item.username = post.user?.username
        item.caption = post.caption
        item.likeCount = post.likeCount
        item.timeAgo = post.createdAt.timeAgo()
        return item
    }
}
