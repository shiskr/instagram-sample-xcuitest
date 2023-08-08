//
//  FeedStyle.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-01.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

class FeedStyle {
    static let shared = FeedStyle()
    
    var navigationViewModel: NavigationViewModel
    var cellViewModel: CellViewModel
    var progressViewModel: ProgressViewModel
    var errorViewModel: ErrorViewModel
    var noMoreItemsViewModel: NoMoreItemsViewModel
    
    private init() {
        self.navigationViewModel = NavigationViewModel()
        self.cellViewModel = CellViewModel()
        self.progressViewModel = ProgressViewModel()
        self.errorViewModel = ErrorViewModel()
        self.noMoreItemsViewModel = NoMoreItemsViewModel()
    }
    
    struct NavigationViewModel {
        var instagramImage = ApplicationStyle.images.names.instagram()
        var messagerImage = "paperplane"
    }
    
    struct CellViewModel {
        var heartImage = "heart"
        var commentImage = "bubble.right"
        var shareImage = "paperplane"
    }
    
    struct ProgressViewModel {
        func progressModifier() -> ProgressModifier { return ProgressModifier() }
        
        struct ProgressModifier: ViewModifier {
            func body(content: Content) -> some View {
                content
                .tint(ApplicationStyle.colors.black())
            }
        }
    }
    
    struct ErrorViewModel {
        func titleModifier() -> TitleModifier { return TitleModifier() }
        
        struct TitleModifier: ViewModifier {
            let padding = ApplicationConstraints.constant.x2.rawValue
            func body(content: Content) -> some View {
                content
                .font(ApplicationStyle.fonts.regular(size: 12))
                .foregroundColor(ApplicationStyle.colors.red())
                .padding(EdgeInsets(top: self.padding, leading: self.padding, bottom: self.padding, trailing: self.padding))
            }
        }
    }
    
    struct NoMoreItemsViewModel {
        func titleModifier() -> TitleModifier { return TitleModifier() }
        
        struct TitleModifier: ViewModifier {
            let padding = ApplicationConstraints.constant.x2.rawValue
            func body(content: Content) -> some View {
                content
                .font(ApplicationStyle.fonts.regular(size: 12))
                .foregroundColor(ApplicationStyle.colors.black())
                .padding(EdgeInsets(top: self.padding, leading: self.padding, bottom: self.padding, trailing: self.padding))
            }
        }
    }
}
