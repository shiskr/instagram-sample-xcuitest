//
//  FeedModels.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-01.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

enum FeedModels {
    class PaginationModel {
        var isFetchingItems: Bool = false
        var noMoreItems: Bool = false
        var hasError: Bool = false
        var currentPage: Int = 0
        var limit: Int = 10
        var items: [Post] = []
        
        var isUpdatingLikeState: [String : Bool] = [:]
        
        func reset() {
            self.isFetchingItems = false
            self.noMoreItems = false
            self.hasError = false
            self.currentPage = 0
            self.limit = 10
            self.items = []
        }
    }
    
    class DisplayedItem: Identifiable, ObservableObject {
        let id: String
        
        @Published var userImageUrl: String?
        @Published var userImagePlaceholder: String?
        @Published var postImageUrl: String?
        @Published var postImagePlaceholder: String?
        @Published var likeCount: Int = 0
        
        @Published var username: String?
        @Published var caption: String?
        @Published var timeAgo: String?
        
        @Published var isLiked: Bool = false
        @Published var isUpdatingLikeState: Bool = false
        
        init(id: String, userImageUrl: String? = nil, userImagePlaceholder: String? = nil, postImageUrl: String? = nil, postImagePlaceholder: String? = nil, likeCount: Int = 0, username: String? = nil, caption: String? = nil, timeAgo: String? = nil, isLiked: Bool = false, isUpdatingLikeState: Bool = false) {
            self.id = id
            self.userImageUrl = userImageUrl
            self.userImagePlaceholder = userImagePlaceholder
            self.postImageUrl = postImageUrl
            self.postImagePlaceholder = postImagePlaceholder
            self.likeCount = likeCount
            self.username = username
            self.caption = caption
            self.timeAgo = timeAgo
            self.isLiked = isLiked
            self.isUpdatingLikeState = isUpdatingLikeState
        }
    }
    
    struct ItemsPresentation {
        struct Response {
            let items: [Post]
        }
        
        struct ViewModel {
            let items: [DisplayedItem]
        }
    }
    
    enum NoMoreItemsPresentation {
        struct ViewModel {
            let text: String
        }
    }
    
    enum ErrorPresentation {
        struct Response {
            let error: OperationError?
        }
        
        struct ViewModel {
            let text: String
        }
    }
    
    struct Like {
        struct Request {
            var id: String
        }
        
        struct Response {
            var id: String
            var likeCount: Int
        }
        
        struct ViewModel {
            var id: String
            var likeCount: Int
        }
    }
    
    struct ItemLoadingState {
        struct Response {
            var id: String
            var isLoading: Bool
        }
        
        struct ViewModel {
            var id: String
            var isLoading: Bool
        }
    }
}
