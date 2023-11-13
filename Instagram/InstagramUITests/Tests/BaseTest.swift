//
//  LivelikeBaseTest.swift
//  LiveLikeTestAppUITests
//
//  Created by Shishir on 18/08/21.
//

import Foundation
import XCTest

class BaseTest: XCTestCase {
    
    let app = XCUIApplication()
    
    override class func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        // setEnvironment()
        // continueAfterFailure = false
        BaseTest().app.launch()
        let attachment = XCTAttachment(screenshot: BaseTest().app.screenshot())
        
//        app.textFields["userInfo"].tap()
//        app.textFields["userInfo"].typeText("test")
//        app.secureTextFields["password"].tap()
//        app.secureTextFields["password"].typeText("test@123")
//        app.buttons["login"].tap()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override class func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
