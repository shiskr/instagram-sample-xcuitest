//
//  FeedLocalization.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-01.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

class FeedLocalization {
    static let shared = FeedLocalization()
    
    private init() {
        
    }
    
    struct LocalizedKey {
        static let
            title = "Feed.scene.title",
            noMoreItemsText = "Feed.scene.no.more.items.text",
            errorText = "Feed.scene.error.text"
    }
    
    func title() -> String { LocalizedKey.title.localized() }
    func noMoreItemsText() -> String { LocalizedKey.noMoreItemsText.localized() }
    func errorText() -> String { LocalizedKey.errorText.localized() }
}
