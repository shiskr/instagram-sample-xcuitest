//
//  LoginView.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 25.07.2023.
//

import SwiftUI

struct LoginView: View {
    var interactor: LoginBusinessLogic?
    var router: LoginRoutingLogic?
    
    @ObservedObject var displayState = DisplayState()
    @EnvironmentObject var currentUserState: CurrentUserState
    @FocusState var focusedField: LoginModels.Field?
    
    init() {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let displayer = DisplayState()
        
        presenter.displayer = displayer
        interactor.presenter = presenter
        
        self.interactor = interactor
        self.displayState = displayer
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                self.setupLogoImage()
                VStack {
                    self.setupAccountTextField()
                    self.setupPasswordTextField()
                    self.setupForgotPasswordButton()
                    self.setupLoginButton()
                }
                .padding(.horizontal, ApplicationConstraints.constant.x24.rawValue)
            }
            .navigationDestination(isPresented: self.$displayState.shouldNavigateToForgotPassword) {
                ForgotPasswordView()
            }
        }
        .onAppear {
            self.interactor?.shouldSetupContent()
        }
        .alert(self.displayState.alertTitle, isPresented: self.$displayState.presentAlert, actions: {})
        .onChange(of: self.displayState.shouldNavigateToFeed) { _ in
            self.currentUserState.login()
        }
    }
    
    @ViewBuilder func setupLogoImage() -> some View {
        Image("instagram_logo_image")
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
    
    @ViewBuilder func setupAccountTextField() -> some View {
        TitleTextFieldView(model: self.displayState.account, style: self.displayState.accountStyle, onTextChanged: { text in
            self.interactor?.shouldUpdateAccount(request: LoginModels.TextUpdate.Request(text: text))
            self.interactor?.shouldValidateAccount()
            self.interactor?.shouldHandleLoginState()
        }, onSubmit: {
            self.focusedField = .password
        })
        .focused(self.$focusedField, equals: .email)
    }
    
    @ViewBuilder func setupPasswordTextField() -> some View {
        TitleTextFieldView(model: self.displayState.password, style: self.displayState.passwordStyle, onTextChanged: { text in
            self.interactor?.shouldUpdatePassword(request: LoginModels.TextUpdate.Request(text: text))
            self.interactor?.shouldValidatePassword()
            self.interactor?.shouldHandleLoginState()
        }, onSubmit: {
            self.focusedField = nil
        })
        .focused(self.$focusedField, equals: .password)
    }
    
    @ViewBuilder func setupForgotPasswordButton() -> some View {
        LoadingButton(model: self.displayState.forgotPasswordButtonModel, style: self.displayState.forgotPasswordButtonStyle) {
            self.dismissKeyboard()
            self.displayState.shouldNavigateToForgotPassword = true
        }
        .frame(height: ApplicationConstraints.constant.x40.rawValue)
    }
    
    @ViewBuilder func setupLoginButton() -> some View {
        LoadingButton(model: self.displayState.loginButtonModel, style: self.displayState.loginButtonStyle) {
            self.dismissKeyboard()
            self.interactor?.shouldLogin()
        }
        .frame(height: ApplicationConstraints.constant.x40.rawValue)
    }
    
    private func dismissKeyboard() {
        self.focusedField = nil
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

