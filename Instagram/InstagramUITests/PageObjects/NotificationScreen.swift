//
//  Created by Shishir on 10/10/23.
//

import XCTest
class NotificationScreen: BaseScreen {
    override var rootElement: XCUIElement {
        _ = notificationText.waitForExistence(timeout: 10)
        return notificationText
    }
 
    lazy var notificationText = app.staticTexts["Search"]
}
