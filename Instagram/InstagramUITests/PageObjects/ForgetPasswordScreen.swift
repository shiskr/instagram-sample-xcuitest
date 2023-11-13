//
//  Created by Shishir on 10/10/23.
//

import XCTest
class ForgetPasswordScreen: BaseScreen {
    override var rootElement: XCUIElement {
        _ = forgetPassText.waitForExistence(timeout: 10)
        return forgetPassText
    }
 
    lazy var forgetPassText = app.staticTexts["Forgot password!"]
    
    func isForgetPassTextVisible(text: String) -> Bool{
        return isStaticTextVisible(text)
    }
}
