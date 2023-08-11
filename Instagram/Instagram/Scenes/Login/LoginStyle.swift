//
//  LoginStyle.swift
//  Instagram
//
//  Created by Bee Wise on 2023-07-25.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

class LoginStyle {
    static let shared = LoginStyle()
    
    var contentViewModel: ContentViewModel
    var accountTextFieldViewModel: AccountTextFieldViewModel
    var passwordTextFieldViewModel: PasswordTextFieldViewModel
    var loginButtonViewModel: LoginButtonViewModel
    var forgotButtonViewModel: ForgotButtonViewModel
    
    
    private init() {
        self.contentViewModel = ContentViewModel()
        self.accountTextFieldViewModel = AccountTextFieldViewModel()
        self.passwordTextFieldViewModel = PasswordTextFieldViewModel()
        self.loginButtonViewModel = LoginButtonViewModel()
        self.forgotButtonViewModel = ForgotButtonViewModel()
    }
    
    struct ContentViewModel {
        var backgroundColor: Color = ApplicationStyle.colors.white()
    }
    
    struct AccountTextFieldViewModel {
        func field() -> TitleTextFieldView.TextFieldStyleModifier {
            var modifier = TitleTextFieldView.TextFieldStyleModifier()
            modifier.color = ApplicationStyle.colors.black()
            modifier.autocapitalization = .none
            modifier.font = ApplicationStyle.fonts.regular(size: 14)
            modifier.background = ApplicationStyle.colors.lightGray()
            modifier.cornerRadius = ApplicationConstraints.constant.x10.rawValue
            modifier.padding = EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
            modifier.submitLabel = .next
            return modifier
        }
        
        func error() -> TitleTextFieldView.TextStyleModifier {
            var modifier = TitleTextFieldView.TextStyleModifier()
            modifier.color = ApplicationStyle.colors.red()
            modifier.font = ApplicationStyle.fonts.regular(size: 12)
            return modifier
        }
    }
    
    struct PasswordTextFieldViewModel {
        func field() -> TitleTextFieldView.TextFieldStyleModifier {
            var modifier = TitleTextFieldView.TextFieldStyleModifier()
            let padding = ApplicationConstraints.constant.x12.rawValue
            modifier.autocapitalization = .none
            modifier.font = ApplicationStyle.fonts.regular(size: 14)
            modifier.background = ApplicationStyle.colors.lightGray()
            modifier.cornerRadius = ApplicationConstraints.constant.x10.rawValue
            modifier.padding = EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
            modifier.submitLabel = .done
            return modifier
        }
        
        func error() -> TitleTextFieldView.TextStyleModifier {
            var modifier = TitleTextFieldView.TextStyleModifier()
            modifier.color = ApplicationStyle.colors.red()
            modifier.font = ApplicationStyle.fonts.regular(size: 12)
            return modifier
        }
    }
    
    struct LoginButtonViewModel {
        func title() -> LoadingButton.TitleStyleModifier {
            var modifier = LoadingButton.TitleStyleModifier()
            let padding = ApplicationConstraints.constant.x10.rawValue
            modifier.padding = EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
            modifier.color = ApplicationStyle.colors.white()
            modifier.font = ApplicationStyle.fonts.regular(size: 14)
            return modifier
        }
        
        func enabledContent() -> LoadingButton.ContentStyleModifier {
            var modifier = LoadingButton.ContentStyleModifier()
            modifier.background = ApplicationStyle.colors.blue()
            modifier.cornerRadius = ApplicationConstraints.constant.x8.rawValue
            return modifier
        }
        
        func disabledContent() -> LoadingButton.ContentStyleModifier {
            var modifier = LoadingButton.ContentStyleModifier()
            modifier.background = ApplicationStyle.colors.blue().opacity(0.5)
            modifier.cornerRadius = ApplicationConstraints.constant.x8.rawValue
            return modifier
        }
    }
    
    struct ForgotButtonViewModel {
        func title() -> LoadingButton.TitleStyleModifier {
            var modifier = LoadingButton.TitleStyleModifier()
            let padding = ApplicationConstraints.constant.x4.rawValue
            modifier.padding = EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
            modifier.color = ApplicationStyle.colors.blue()
            modifier.font = ApplicationStyle.fonts.bold(size: 14)
            modifier.alignment = .trailing
            return modifier
        }
    }
}
