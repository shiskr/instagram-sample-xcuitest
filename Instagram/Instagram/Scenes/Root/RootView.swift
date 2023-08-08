//
//  MainView.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 31.07.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var currentUserState = CurrentUserState()
    
    var body: some View {
        self.setupContentView()
    }
    
    @ViewBuilder func setupContentView() -> some View {
        switch self.currentUserState.state {
        case .loggedIn: MainView().environmentObject(self.currentUserState)
        default: LoginView().environmentObject(self.currentUserState)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
