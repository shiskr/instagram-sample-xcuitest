//
//  FeedInteractor.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-01.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

protocol FeedBusinessLogic {
    func shouldHandleLikeState(request: FeedModels.Like.Request)
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
    
    private func getItem(id: String) -> Post? {
        return self.paginationModel.items.first(where: { $0.id == id })
    }
}

extension FeedInteractor {
    func shouldHandleLikeState(request: FeedModels.Like.Request) {
        guard self.isUpdatingLikeState(id: request.id) == false else {
            return
        }
        guard let like = self.getItem(id: request.id)?.like else {
            self.shouldLike(id: request.id)
            return
        }
        self.shouldRemoveLike(id: request.id, like: like)
    }
    
    func isUpdatingLikeState(id: String) -> Bool {
        guard let isUpdating = self.paginationModel.isUpdatingLikeState[id] else {
            return false
        }
        return isUpdating
    }
}


extension FeedInteractor {
    func shouldLike(id: String) {
        self.paginationModel.isUpdatingLikeState[id] = true
        self.presenter?.presentLikeLoadingState(response: FeedModels.ItemLoadingState.Response(id: id, isLoading: true))
        self.worker?.saveLike(postId: id)
    }
    
    func successDidSaveLike(postId: String, like: Like) {
        let post = self.getItem(id: postId)
        post?.likeCount += 1
        post?.like = like
        self.paginationModel.isUpdatingLikeState[postId] = false
        self.presenter?.presentLikeLoadingState(response: FeedModels.ItemLoadingState.Response(id: postId, isLoading: false))
        self.presenter?.presentSuccessDidSaveLike(response: FeedModels.Like.Response(id: postId, likeCount: post?.likeCount ?? Int.zero))
    }
    
    func failureDidSaveLike(postId: String, error: OperationError) {
        self.paginationModel.isUpdatingLikeState[postId] = false
        self.presenter?.presentLikeLoadingState(response: FeedModels.ItemLoadingState.Response(id: postId, isLoading: false))
    }
}

extension FeedInteractor {
    func shouldRemoveLike(id: String, like: Like) {
        self.paginationModel.isUpdatingLikeState[id] = true
        self.presenter?.presentLikeLoadingState(response: FeedModels.ItemLoadingState.Response(id: id, isLoading: true))
        self.worker?.removeLike(postId: id, like: like)
    }
    
    func successDidRemoveLike(postId: String) {
        let post = self.getItem(id: postId)
        post?.likeCount -= 1
        post?.like = nil
        self.paginationModel.isUpdatingLikeState[postId] = false
        self.presenter?.presentLikeLoadingState(response: FeedModels.ItemLoadingState.Response(id: postId, isLoading: false))
        self.presenter?.presentSuccessDidRemoveLike(response: FeedModels.Like.Response(id: postId, likeCount: post?.likeCount ?? Int.zero))
    }
    
    func failureDidRemoveLike(postId: String, error: OperationError) {
        self.paginationModel.isUpdatingLikeState[postId] = false
        self.presenter?.presentLikeLoadingState(response: FeedModels.ItemLoadingState.Response(id: postId, isLoading: false))
    }
}
