//
//  FeedInteractor.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-01.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

protocol FeedBusinessLogic {
    func shouldLike(request: FeedModels.Like.Request)
    func shouldFetchItems()
}

class FeedInteractor: FeedBusinessLogic, FeedWorkerDelegate {
    var presenter: FeedPresentationLogic?
    var worker: FeedWorker?
    
    var paginationModel: FeedModels.PaginationModel = FeedModels.PaginationModel()
    
    init() {
        self.worker = FeedWorker(delegate: self)
    }
    
    func shouldFetchItems() {
        if !self.paginationModel.isFetchingItems && !self.paginationModel.noMoreItems {
            self.paginationModel.isFetchingItems = true
            self.presenter?.presentLoadingState()
            self.worker?.fetchPosts(page: self.paginationModel.currentPage, limit: self.paginationModel.limit)
        }
    }
    
    func successDidFetchPosts(posts: [Post]) {
        self.paginationModel.isFetchingItems = false
        self.paginationModel.items.append(contentsOf: posts)
        self.paginationModel.currentPage += 1
        self.paginationModel.hasError = false

        self.presenter?.presentNotLoadingState()
        self.presenter?.presentItems(response: FeedModels.ItemsPresentation.Response(items: posts))
        self.presenter?.presentRemoveError()

        self.shouldVerifyNoMoreItems(count: posts.count)
    }
    
    func failureDidFetchPosts(error: OperationError) {
        self.paginationModel.isFetchingItems = false
        self.paginationModel.hasError = true
        self.presenter?.presentNotLoadingState()
        self.presenter?.presentError(response: FeedModels.ErrorPresentation.Response(error: error))
    }
    
    private func shouldVerifyNoMoreItems(count: Int) {
        if (count < self.paginationModel.limit) {
            self.paginationModel.noMoreItems = true
            self.presenter?.presentNoMoreItems()
        }
    }
}

extension FeedInteractor {
    func shouldLike(request: FeedModels.Like.Request) {
        // TODO: Work in progress
        self.presenter?.presentSuccessDidLike(response: FeedModels.Like.Response(item: request.item, likeCount: 20))
    }
}
