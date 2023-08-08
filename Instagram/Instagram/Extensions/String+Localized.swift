//
//  String+Localized.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 28.07.2023.
//

import Foundation

extension String {
    public func localized(in bundle: Bundle = Bundle.main, withComment comment: String = "") -> String {
        return NSLocalizedString(self, bundle: bundle, comment: comment)
    }
}
