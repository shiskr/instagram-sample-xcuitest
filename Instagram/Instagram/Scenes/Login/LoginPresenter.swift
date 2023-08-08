//
//  LoginPresenter.swift
//  Instagram
//
//  Created by Bee Wise on 2023-07-25.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

protocol LoginPresentationLogic {
    func presentSetupContent(response: LoginModels.ContentSetup.Response)
    
    func presentLoginLoadingState()
    func presentLoginNotLoadingState()
    
    func presentLoginEnabledState()
    func presentLoginDisabledState()
    
    func presentAccountErrorState(response: LoginModels.State.Response)
    func presentPasswordErrorState(response: LoginModels.State.Response)
    func presentErrorState(response: LoginModels.ErrorState.Response)
    
    func presentNavigateToFeed()
}

class LoginPresenter: LoginPresentationLogic {
    var displayer: LoginDisplayLogic?
    
    func presentSetupContent(response: LoginModels.ContentSetup.Response) {
        var viewModel = LoginModels.ContentSetup.ViewModel()
        viewModel.account = self.accountTextFieldModel()
        viewModel.accountStyle = self.accountTextFieldStyle()
        viewModel.password = self.passwordTextFieldModel()
        viewModel.passwordStyle = self.setupPasswordTextFieldStyle()
        viewModel.loginButtonModel = self.loginButtonModel()
        viewModel.loginButtonStyle = self.loginButtonStyle()
        viewModel.forgotPasswordButtonModel = self.forgotPasswordButtonModel()
        viewModel.forgotPasswordButtonStyle = self.forgotPasswordButtonStyle()
        self.displayer?.displaySetupContent(viewModel: viewModel)
    }
    
    func presentLoginLoadingState() {
        self.displayer?.displayLoginLoadingState()
    }
    
    func presentLoginNotLoadingState() {
        self.displayer?.displayLoginNotLoadingState()
    }
    
    func presentLoginEnabledState() {
        self.displayer?.displayLoginEnabledState(viewModel: LoginModels.LoginButtonState.ViewModel(contentStyle: LoginStyle.shared.loginButtonViewModel.enabledContent()))
    }
    
    func presentLoginDisabledState() {
        self.displayer?.displayLoginDisabledState(viewModel: LoginModels.LoginButtonState.ViewModel(contentStyle: LoginStyle.shared.loginButtonViewModel.disabledContent()))
    }
    
    func presentAccountErrorState(response: LoginModels.State.Response) {
        self.displayer?.displayAccountErrorState(viewModel: LoginModels.State.ViewModel(state: response.state, error: response.error))
    }
    
    func presentPasswordErrorState(response: LoginModels.State.Response) {
        self.displayer?.displayPasswordErrorState(viewModel: LoginModels.State.ViewModel(state: response.state, error: response.error))
    }
    
    func presentErrorState(response: LoginModels.ErrorState.Response) {
        self.displayer?.displayErrorState(viewModel: LoginModels.ErrorState.ViewModel(error: self.parseError(error: response.error)))
    }
    
    func presentNavigateToFeed() {
        self.displayer?.displayNavigateToFeed()
    }
    
    private func parseError(error: OperationError?) -> String {
        return LoginLocalization.shared.wrongCredentialsError()
    }
}

extension LoginPresenter {
    private func accountTextFieldModel() -> TitleTextFieldView.Model {
        let model = TitleTextFieldView.Model()
        model.isSecure = false
        model.text = String()
        model.placeholder = LoginLocalization.shared.accountPlaceholder()
        model.error = LoginLocalization.shared.accountError()
        return model
    }
    
    private func passwordTextFieldModel() -> TitleTextFieldView.Model {
        let model = TitleTextFieldView.Model()
        model.isSecure = true
        model.text = String()
        model.placeholder = LoginLocalization.shared.passwordPlaceholder()
        model.error = LoginLocalization.shared.passwordError()
        return model
    }
    
    private func accountTextFieldStyle() -> TitleTextFieldView.Style {
        let style = TitleTextFieldView.Style()
        style.text = LoginStyle.shared.accountTextFieldViewModel.field()
        style.error = LoginStyle.shared.accountTextFieldViewModel.error()
        return style
    }
    
    private func setupPasswordTextFieldStyle() -> TitleTextFieldView.Style {
        let style = TitleTextFieldView.Style()
        style.text = LoginStyle.shared.passwordTextFieldViewModel.field()
        style.error = LoginStyle.shared.passwordTextFieldViewModel.error()
        return style
    }
    
    private func loginButtonModel() -> LoadingButton.Model {
        let model = LoadingButton.Model()
        model.title = LoginLocalization.shared.loginTitle()
        model.isLoading = false
        model.isDisabled = true
        return model
    }
    
    private func loginButtonStyle() -> LoadingButton.Style {
        let style = LoadingButton.Style()
        style.title = LoginStyle.shared.loginButtonViewModel.title()
        style.content = LoginStyle.shared.loginButtonViewModel.disabledContent()
        return style
    }
    
    private func forgotPasswordButtonModel() -> LoadingButton.Model {
        let model = LoadingButton.Model()
        model.title = LoginLocalization.shared.forgotPasswordTitle()
        model.isLoading = false
        model.isDisabled = false
        return model
    }
    
    private func forgotPasswordButtonStyle() -> LoadingButton.Style {
        let style = LoadingButton.Style()
        style.title = LoginStyle.shared.forgotButtonViewModel.title()
        return style
    }
}
