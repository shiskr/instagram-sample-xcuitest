//
//  Created by Shishir on 10/10/23.
//

import XCTest
class ProfileScreen: BaseScreen {
    
    override var rootElement: XCUIElement {
        _ = profileText.waitForExistence(timeout: 10)
        return profileText
    }
 
    lazy var profileText = app.staticTexts["Search"]
}
