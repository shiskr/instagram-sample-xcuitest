//
//  Created by Shishir on 10/10/23.
//

import XCTest
class UploadPostScreen: BaseScreen {
    override var rootElement: XCUIElement {
        _ = uploadPostText.waitForExistence(timeout: 10)
        return uploadPostText
    }
    
    lazy var uploadPostText = app.staticTexts["Upload Post"]
}
