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
        
        var userImageUrl: String?
        var userImagePlaceholder: String?
        var postImageUrl: String?
        var postImagePlaceholder: String?
        @Published var likeCount: Int = 0
        var commentCount: Int = 0
        var shareCount: Int = 0
        
        var username: String?
        var caption: String?
        var timeAgo: String?
        
        init(id: String, userImageUrl: String? = nil, userImagePlaceholder: String? = nil, postImageUrl: String? = nil, postImagePlaceholder: String? = nil, likeCount: Int = 0, commentCount: Int = 0, shareCount: Int = 0, username: String? = nil, caption: String? = nil, timeAgo: String? = nil) {
            self.id = id
            self.userImageUrl = userImageUrl
            self.userImagePlaceholder = userImagePlaceholder
            self.postImageUrl = postImageUrl
            self.postImagePlaceholder = postImagePlaceholder
            self.likeCount = likeCount
            self.commentCount = commentCount
            self.shareCount = shareCount
            self.username = username
            self.caption = caption
            self.timeAgo = timeAgo
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
            var item: DisplayedItem
        }
        
        struct Response {
            var item: DisplayedItem
            var likeCount: Int
        }
        
        struct ViewModel {
            var item: DisplayedItem
            var likeCount: Int
        }
    }
}
