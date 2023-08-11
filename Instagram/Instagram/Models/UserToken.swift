//
//  UserToken.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 27.07.2023.
//

import Foundation

public class UserToken {
    public static var currentUserToken: UserToken?
    
    public var token: String
    
    public init(token: String) {
        self.token = token
    }
}
