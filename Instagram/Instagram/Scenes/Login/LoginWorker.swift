//
//  LoginWorker.swift
//  Instagram
//
//  Created by Bee Wise on 2023-07-25.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import Foundation

protocol LoginWorkerDelegate: AnyObject {
    func successDidLogin(userToken: UserToken?)
    func failureDidSignIn(error: OperationError)
}

class LoginWorker {
    weak var delegate: LoginWorkerDelegate?
    
    init(delegate: LoginWorkerDelegate?) {
        self.delegate = delegate
    }
    
    func login(account: String, password: String) {
        let delay: Int = Int.random(in: 350...1000)
        let shouldFail: Bool = Bool.random()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(delay)) {
            if shouldFail {
                self.delegate?.failureDidSignIn(error: OperationError.noDataAvailable)
            } else {
                self.delegate?.successDidLogin(userToken: UserToken(token: "token"))
            }
        }
    }
}
