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
                        .accessibility(identifier: "feed")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .accessibility(identifier: "search")
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                        .accessibility(identifier: "uploadPost")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                        .accessibility(identifier: "notifications")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                        .accessibility(identifier: "profile")
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
