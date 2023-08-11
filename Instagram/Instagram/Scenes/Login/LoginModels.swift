//
//  LoginModels.swift
//  Instagram
//
//  Created by Bee Wise on 2023-07-25.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

enum LoginModels {
    class BusinessModel {
        var account: String = String()
        var password: String = String()
        var isLoggingIn: Bool = false
    }
    
    enum Field: Int, Hashable {
        case email
        case password
    }
    
    enum ContentSetup {
        struct Response {
            let model: BusinessModel
        }
        
        struct ViewModel {
            var loginButtonModel = LoadingButton.Model()
            var loginButtonStyle = LoadingButton.Style()
            
            var account = TitleTextFieldView.Model()
            var accountStyle = TitleTextFieldView.Style()
            
            var password = TitleTextFieldView.Model()
            var passwordStyle = TitleTextFieldView.Style()
            
            var forgotPasswordButtonModel = LoadingButton.Model()
            var forgotPasswordButtonStyle = LoadingButton.Style()
        }
    }
    
    struct TextUpdate {
        struct Request {
            let text: String
        }
    }
    
    struct State {
        struct Response {
            let state: TitleTextFieldView.State
            let error: String
        }
        
        struct ViewModel {
            let state: TitleTextFieldView.State
            let error: String
        }
    }
    
    struct ErrorState {
        struct Response {
            let error: OperationError?
        }
        
        struct ViewModel {
            let error: String
        }
    }
    
    struct LoginButtonState {
        struct ViewModel {
            let contentStyle: LoadingButton.ContentStyleModifier
        }
    }
}
