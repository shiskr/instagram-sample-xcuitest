//
//  LoginInteractor.swift
//  Instagram
//
//  Created by Bee Wise on 2023-07-25.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

protocol LoginBusinessLogic {
    func shouldSetupContent()
    
    func shouldUpdateAccount(request: LoginModels.TextUpdate.Request)
    func shouldUpdatePassword(request: LoginModels.TextUpdate.Request)
    
    func shouldValidateAccount()
    func shouldValidatePassword()
    
    func shouldHandleLoginState()
    func shouldLogin()
}

class LoginInteractor: LoginBusinessLogic, LoginWorkerDelegate {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    var model = LoginModels.BusinessModel()
    
    init() {
        self.worker = LoginWorker(delegate: self)
    }
    
    func shouldSetupContent() {
        self.presenter?.presentSetupContent(response: LoginModels.ContentSetup.Response(model: self.model))
    }
    
    func shouldUpdateAccount(request: LoginModels.TextUpdate.Request) {
        self.model.account = request.text
    }
    
    func shouldUpdatePassword(request: LoginModels.TextUpdate.Request) {
        self.model.password = request.text
    }
    
    func shouldValidateAccount() {
        if self.isAccountValid() {
            self.presenter?.presentAccountErrorState(response: LoginModels.State.Response(state: .normal, error: String()))
        } else {
            self.presenter?.presentAccountErrorState(response: LoginModels.State.Response(state: .error, error: "Email or username must be at least 1 character"))
        }
    }
    
    func shouldValidatePassword() {
        if self.isPasswordValid() {
            self.presenter?.presentPasswordErrorState(response: LoginModels.State.Response(state: .normal, error: String()))
        } else {
            self.presenter?.presentPasswordErrorState(response: LoginModels.State.Response(state: .error, error: "Password must be at least 8 characters"))
        }
    }
    
    func shouldHandleLoginState() {
        self.handleLoginState()
    }
    
    func shouldLogin() {
        guard self.isAccountValid() && self.isPasswordValid() else {
            return
        }
        
        if !self.model.isLoggingIn {
            self.model.isLoggingIn = true
            self.presenter?.presentLoginLoadingState()
            self.presenter?.presentLoginDisabledState()
            self.worker?.login(account: self.model.account, password: self.model.password)
        }
    }
    
    private func isAccountValid() -> Bool {
        return !self.model.account.isEmpty
    }
    
    private func isPasswordValid() -> Bool {
        return !self.model.password.isEmpty && self.model.password.count >= 6
    }
    
    private func handleLoginState() {
        if self.isAccountValid() && self.isPasswordValid() {
            self.presenter?.presentLoginEnabledState()
        } else {
            self.presenter?.presentLoginDisabledState()
        }
    }
}

extension LoginInteractor {
    func successDidLogin(userToken: UserToken?) {
        self.model.isLoggingIn = false
        self.presenter?.presentLoginNotLoadingState()
        self.presenter?.presentLoginEnabledState()
        self.presenter?.presentNavigateToFeed()
    }
    
    func failureDidSignIn(error: OperationError) {
        self.model.isLoggingIn = false
        self.presenter?.presentLoginNotLoadingState()
        self.presenter?.presentLoginEnabledState()
        self.presenter?.presentErrorState(response: LoginModels.ErrorState.Response(error: error))
    }
}
