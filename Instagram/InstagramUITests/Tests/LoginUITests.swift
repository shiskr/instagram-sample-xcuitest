import Foundation
import XCTest

class LoginUITests: BaseTest{
    
    let loginScreen = LoginScreen()
    let forgetPassScreen = ForgetPasswordScreen()
    let feedScreen = FeedScreen()
    
    func test1ForgetPassword(){
        loginScreen.tapForgotpasswordBtn();
        XCTAssertTrue(forgetPassScreen.isForgetPassTextVisible(text: "Forgot password!"))
        app.navigationBars.buttons["Back"].tap()
    }
    
    func test2Login() throws {

//        let attachment = XCTAttachment(screenshot: app.screenshot())
//        attachment.name = "Launch Screen"
//        attachment.lifetime = .keepAlways
//        add(attachment)
        
        loginScreen.enterUsername(username: "test")
        loginScreen.enterPassword(password: "test@123")
        loginScreen.tapLoginBtn()
        sleep(2)
        if(loginScreen.isWrongUserPassVisible()){
            repeat {
                loginScreen.clickOK()
                sleep(2)
                loginScreen.tapLoginBtn()
            } while loginScreen.isWrongUserPassVisible()
        }
        sleep(2)
        feedScreen.areTabsVisible()
    }

}
