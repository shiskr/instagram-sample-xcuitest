//
//  LoginView+DisplayLogic.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 27.07.2023.
//

import Foundation

protocol LoginDisplayLogic {
    func displaySetupContent(viewModel: LoginModels.ContentSetup.ViewModel)
    
    func displayLoginLoadingState()
    func displayLoginNotLoadingState()
    
    func displayLoginEnabledState(viewModel: LoginModels.LoginButtonState.ViewModel)
    func displayLoginDisabledState(viewModel: LoginModels.LoginButtonState.ViewModel)
    
    func displayAccountErrorState(viewModel: LoginModels.State.ViewModel)
    func displayPasswordErrorState(viewModel: LoginModels.State.ViewModel)
    
    func displayErrorState(viewModel: LoginModels.ErrorState.ViewModel)
    
    func displayNavigateToFeed()
}

extension LoginView {
    class DisplayState: ObservableObject, LoginDisplayLogic {
        @Published var forgotPasswordButtonModel = LoadingButton.Model()
        @Published var forgotPasswordButtonStyle = LoadingButton.Style()
        
        @Published var loginButtonModel = LoadingButton.Model()
        @Published var loginButtonStyle = LoadingButton.Style()
        
        @Published var account = TitleTextFieldView.Model()
        @Published var accountStyle = TitleTextFieldView.Style()
        
        @Published var password = TitleTextFieldView.Model()
        @Published var passwordStyle = TitleTextFieldView.Style()
        
        @Published var presentAlert: Bool = false
        @Published var alertTitle: String = String()
        
        @Published var shouldNavigateToForgotPassword: Bool = false
        @Published var shouldNavigateToFeed: Bool = false
        
        func displaySetupContent(viewModel: LoginModels.ContentSetup.ViewModel) {
            DispatchQueue.main.async {
                self.account = viewModel.account
                self.accountStyle = viewModel.accountStyle
                
                self.password = viewModel.password
                self.passwordStyle = viewModel.passwordStyle
                
                self.loginButtonModel = viewModel.loginButtonModel
                self.loginButtonStyle = viewModel.loginButtonStyle
                
                self.forgotPasswordButtonModel = viewModel.forgotPasswordButtonModel
                self.forgotPasswordButtonStyle = viewModel.forgotPasswordButtonStyle
            }
        }
        
        func displayLoginLoadingState() {
            DispatchQueue.main.async {
                self.loginButtonModel.isLoading = true
                self.loginButtonModel.isDisabled = true
            }
        }
        
        func displayLoginNotLoadingState() {
            DispatchQueue.main.async {
                self.loginButtonModel.isLoading = false
                self.loginButtonModel.isDisabled = false
            }
        }
        
        func displayLoginEnabledState(viewModel: LoginModels.LoginButtonState.ViewModel) {
            DispatchQueue.main.async {
                self.loginButtonModel.isDisabled = false
                self.loginButtonStyle.content = viewModel.contentStyle
            }
        }
        
        func displayLoginDisabledState(viewModel: LoginModels.LoginButtonState.ViewModel) {
            DispatchQueue.main.async {
                self.loginButtonModel.isDisabled = true
                self.loginButtonStyle.content = viewModel.contentStyle
            }
        }
        
        func displayAccountErrorState(viewModel: LoginModels.State.ViewModel) {
            DispatchQueue.main.async {
                self.account.error = viewModel.error
                self.account.state = viewModel.state
            }
        }
        
        func displayPasswordErrorState(viewModel: LoginModels.State.ViewModel) {
            DispatchQueue.main.async {
                self.password.error = viewModel.error
                self.password.state = viewModel.state
            }
        }
        
        func displayErrorState(viewModel: LoginModels.ErrorState.ViewModel) {
            DispatchQueue.main.async {
                self.alertTitle = viewModel.error
                self.presentAlert = true
            }  
        }
        
        func displayNavigateToFeed() {
            DispatchQueue.main.async {
                self.shouldNavigateToFeed = true
            }
        }
    }
}
