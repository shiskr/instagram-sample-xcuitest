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
}
