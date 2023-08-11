//
//  User.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 01.08.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var email: String
    var username: String
    var fullname: String
    var bio: String?
    var imageUrl: String?
}

extension User {
    static var mock: [User] = [
        User(id: UUID().uuidString, email: "user1@email.com", username: "username1", fullname: "Fullname 1", bio: "Bio 1", imageUrl: "https://picsum.photos/200/300"),
        User(id: UUID().uuidString, email: "user2@email.com", username: "username2", fullname: "Fullname 2", bio: "Bio 2", imageUrl: "https://picsum.photos/200/300"),
        User(id: UUID().uuidString, email: "user3@email.com", username: "username3", fullname: "Fullname 3", bio: "Bio 3", imageUrl: "https://picsum.photos/200/300"),
        User(id: UUID().uuidString, email: "user4@email.com", username: "username4", fullname: "Fullname 4", bio: "Bio 4", imageUrl: "https://picsum.photos/200/300"),
        User(id: UUID().uuidString, email: "user5@email.com", username: "username5", fullname: "Fullname 5", bio: "Bio 5", imageUrl: "https://picsum.photos/200/300")
    ]
}
