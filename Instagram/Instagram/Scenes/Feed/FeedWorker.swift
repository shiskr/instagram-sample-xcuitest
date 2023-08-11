//
//  FeedWorker.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-01.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

protocol FeedWorkerDelegate: AnyObject {
    func successDidFetchPosts(posts: [Post])
    func failureDidFetchPosts(error: OperationError)
    
    func successDidSaveLike(postId: String, like: Like)
    func failureDidSaveLike(postId: String, error: OperationError)
    
    func successDidRemoveLike(postId: String)
    func failureDidRemoveLike(postId: String, error: OperationError)
}

class FeedWorker {
    weak var delegate: FeedWorkerDelegate?
    
    init(delegate: FeedWorkerDelegate?) {
        self.delegate = delegate
    }
    
    func fetchPosts(page: Int, limit: Int) {
        let delay: Int = Int.random(in: 350...1000)
        let shouldFail: Bool = Bool.random()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(delay)) {
            if shouldFail {
                self.delegate?.failureDidFetchPosts(error: OperationError.noDataAvailable)
            } else {
                self.delegate?.successDidFetchPosts(posts: Post.mock)
            }
        }
    }
    
    func saveLike(postId: String) {
        let delay: Int = Int.random(in: 350...1000)
        let shouldFail: Bool = Bool.random()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(delay)) {
            if shouldFail {
                self.delegate?.failureDidSaveLike(postId: postId, error: OperationError.noDataAvailable)
            } else {
                self.delegate?.successDidSaveLike(postId: postId, like: Like.dummyLike)
            }
        }
    }
    
    func removeLike(postId: String, like: Like) {
        let delay: Int = Int.random(in: 350...1000)
        let shouldFail: Bool = Bool.random()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(delay)) {
            if shouldFail {
                self.delegate?.failureDidRemoveLike(postId: postId, error: OperationError.noDataAvailable)
            } else {
                self.delegate?.successDidRemoveLike(postId: postId)
            }
        }
    }
}
