//
//  Created by Shishir on 10/10/23.
//

import XCTest
class LoginScreen: BaseScreen {
    override var rootElement: XCUIElement {
        _ = instagramLogoImage.waitForExistence(timeout: 10)
        return instagramLogoImage
    }
    
    let forgetPassText = "Wrong username or password"
    lazy var usernameField = appTextField("userInfo")
    lazy var passwordField = appSecureTextField("password")
    lazy var forgotPasswordBtn = appButton("forgetPass")
    lazy var loginBtn = appButton("login")
    
    func enterUsername (username: String) {
        _ = usernameField.waitForExistence(timeout: 20)
        usernameField.tap()
        usernameField.typeText(username)
    }
    
    func enterPassword (password: String) {
        _ = passwordField.waitForExistence(timeout: 20)
        passwordField.tap()
        passwordField.typeText(password)
    }
    
    func tapLoginBtn () {
        loginBtn.tap()
    }
    
    func tapForgotpasswordBtn () {
        forgotPasswordBtn.tap()
    }
    
    func isWrongUserPassVisible() -> Bool{
        return isStaticTextVisible(forgetPassText)
    }
    
    func clickOK(){
        okButton.tap()
    }
}
