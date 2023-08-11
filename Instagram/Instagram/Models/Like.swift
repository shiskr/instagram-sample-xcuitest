//
//  Like.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 09.08.2023.
//

import Foundation

class Like: Identifiable, Codable {
    let id: String
    
    var createdAt: Date
    
    init(id: String, createdAt: Date) {
        self.id = id
        self.createdAt = createdAt
    }
}

extension Like {
    static var dummyLike = Like(id: UUID().uuidString, createdAt: Date())
}
