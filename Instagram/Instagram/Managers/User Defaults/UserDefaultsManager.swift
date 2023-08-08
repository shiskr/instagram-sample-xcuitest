//
//  UserDefaultsManager.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 31.07.2023.
//

import Foundation

protocol UserDefaultsManagerLogic {
    func token() -> String?
    func saveToken(token: String?)
    func deleteToken()
    
    func userToken() -> UserToken?
}

class UserDefaultsManager: UserDefaultsManagerLogic {
    private var userDefaults: UserDefaults = .standard
    
    func token() -> String? {
        return self.userDefaults.string(forKey: Keys.token)
    }
    
    func saveToken(token: String?) {
        self.userDefaults.setValue(token, forKey: Keys.token)
    }
    
    func deleteToken() {
        self.userDefaults.removeObject(forKey: Keys.token)
    }
    
    func userToken() -> UserToken? {
        guard let token = self.token() else {
            return nil
        }
        return UserToken(token: token)
    }
        
    struct Keys {
        static let
            prefix = "instagram.defaults",
            token = prefix + ".user.token"
    }
}
