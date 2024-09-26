//
//  Created by Shishir on 10/10/23.
//

import XCTest
class FeedScreen: BaseScreen {
    
    override var rootElement: XCUIElement {
        _ = feedInstagramLogoImage.waitForExistence(timeout: 10)
        return feedInstagramLogoImage
    }
    
    lazy var usernameField = appTextField("userInfo")
    
}
