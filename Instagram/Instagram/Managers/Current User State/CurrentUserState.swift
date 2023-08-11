//
//  CurrentUserState.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 01.08.2023.
//

import SwiftUI

final class CurrentUserState: ObservableObject {
    enum State {
        case loggedIn
        case loggedOut
    }
    
    @Published private(set) var state: State?
    
    func login() {
        self.state = .loggedIn
    }
    
    func logout() {
        self.state = .loggedOut
    }
}
