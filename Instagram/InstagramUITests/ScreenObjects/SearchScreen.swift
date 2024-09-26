//
//  Created by Shishir on 10/10/23.
//

import XCTest
class SearchScreen: BaseScreen {
    
    override var rootElement: XCUIElement {
        _ = searchText.waitForExistence(timeout: 10)
        return searchText
    }
 
    lazy var searchText = app.staticTexts["Search"]
}
