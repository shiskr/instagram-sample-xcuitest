//
//  LoginLocalization.swift
//  Instagram
//
//  Created by Bee Wise on 2023-07-25.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

class LoginLocalization {
    static let shared = LoginLocalization()
    
    private init() {
        
    }
    
    struct LocalizedKey {
        static let
            accountPlaceholder = "Login.scene.account.placeholder",
            passwordPlaceholder = "Login.scene.password.placeholder",
            accountError = "Login.scene.account.error",
            passwordError = "Login.scene.password.error",
            loginTitle = "Login.scene.login.title",
            forgotPasswordTitle = "Login.scene.forgot.password.title",
            wrongCredentialsError = "Login.scene.wrong.credentials.error"
    }
    
    func accountPlaceholder() -> String { LocalizedKey.accountPlaceholder.localized() }
    func passwordPlaceholder() -> String { LocalizedKey.passwordPlaceholder.localized() }
    
    func accountError() -> String { LocalizedKey.accountError.localized() }
    func passwordError() -> String { LocalizedKey.passwordError.localized() }
    
    func loginTitle() -> String { LocalizedKey.loginTitle.localized() }
    func forgotPasswordTitle() -> String { LocalizedKey.forgotPasswordTitle.localized() }
    func wrongCredentialsError() -> String { LocalizedKey.wrongCredentialsError.localized() }
}
