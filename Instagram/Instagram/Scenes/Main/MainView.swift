//
//  MainView.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 31.07.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var currentUserState: CurrentUserState
    
    var body: some View {
        self.setupTabView()
    }
    
    @ViewBuilder func setupTabView() -> some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Seach")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(ApplicationStyle.colors.black())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
