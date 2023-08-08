//
//  Post.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 01.08.2023.
//

import Foundation

class Post: Identifiable, Codable {
    let id: String
    
    var caption: String
    var likeCount: Int
    var imageUrl: String?
    var user: User?
    
    var createdAt: Date
    
    init(id: String, caption: String, likeCount: Int, imageUrl: String? = nil, user: User? = nil, createdAt: Date) {
        self.id = id
        self.caption = caption
        self.likeCount = likeCount
        self.imageUrl = imageUrl
        self.user = user
        self.createdAt = createdAt
    }
}

extension Post {
    static var mock: [Post] = [
        Post(id: UUID().uuidString, caption: "Caption 1", likeCount: 1, imageUrl: "https://picsum.photos/400/600", user: User.mock[0], createdAt: Date()),
        Post(id: UUID().uuidString, caption: "Caption 2", likeCount: 2, imageUrl: "https://picsum.photos/400/600", user: User.mock[1], createdAt: Date()),
        Post(id: UUID().uuidString, caption: "Caption 3", likeCount: 3, imageUrl: "https://picsum.photos/400/600", user: User.mock[2], createdAt: Date()),
        Post(id: UUID().uuidString, caption: "Caption 4", likeCount: 4, imageUrl: "https://picsum.photos/400/600", user: User.mock[3], createdAt: Date()),
        Post(id: UUID().uuidString, caption: "Caption 5", likeCount: 5, imageUrl: "https://picsum.photos/400/600", user: User.mock[4], createdAt: Date()),
    ]
}
