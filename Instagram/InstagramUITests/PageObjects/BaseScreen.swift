//
//  Created by Shishir on 10/10/23.
//

import XCTest

class Logger {
    func log(_ mlog: String) {
        NSLog(mlog)
    }
}

public class BaseScreen {
    
    typealias Completion = (() -> Void)?
    let app = XCUIApplication()
    let log = Logger().log
    lazy var instagramLogoImage = appImages("instaLogo")
    lazy var feedInstagramLogoImage = appImages("instagram_logo_image")
    lazy var backButton = appButton("Back")
    lazy var okButton = appButton("OK")
    lazy var homeBtn = appButton("feed")
    lazy var searchBtn = appButton("search")
    lazy var uploadPostBtn = appButton("uploadPost")
    lazy var notificationBtn = appButton("notifications")
    lazy var profileBtn = appButton("profile")
    
    required init(timeout: TimeInterval = 10, completion: Completion = nil) {
        log("Waiting \(timeout)s for \(String(describing: self)) exstence")
        XCTAssert(rootElement.waitForExistence(timeout: timeout),
                  "Page \(String(describing: self)) waited , but not loaded")
    }
    
    var rootElement: XCUIElement {
        fatalError("subclass should override rootElement")
    }
    
    func appButton(_ name: String) -> XCUIElement {
        return app.buttons[name]
    }
    
    func appSheet(_ name: String) -> XCUIElement {
        return app.sheets[name]
    }
    
    func appTextField(_ name: String) -> XCUIElement {
        return app.textFields[name]
    }
    
    func appAlertFirstTextField() -> XCUIElement {
        return app.alerts.firstMatch
    }
    
    func appImages(_ name: String) -> XCUIElement {
        return app.images[name]
    }
    
    func appSecureTextField(_ name: String) -> XCUIElement {
        return app.secureTextFields[name]
    }
    
    func textView(_ name: String) -> XCUIElement{
      return app.textViews[name]
    }
    
    func navBar(_ name: String) -> XCUIElement{
      return app.navigationBars[name]
    }
    
    func tapAlertBtn(_ name: String) {
        let ele = app.alerts.buttons[name]
        _ = ele.waitForExistence(timeout: 5)
        app.alerts.buttons[name].tap()
    }
    
    func appStaticText(_ name: String) -> XCUIElement {
        return app.staticTexts[name]
    }
    
    func isStaticTextVisible(_ text: String) -> Bool{
        return app.staticTexts[text].exists
    }
    
    func swipeUp(){
        app.swipeUp(velocity: .fast)
    }
    
    func swipeDown(){
        app.swipeUp(velocity: .fast)
    }
    
    func swipeLeft(){
        app.swipeUp(velocity: .fast)
    }
    
    func swipeRight(){
        app.swipeUp(velocity: .fast)
    }
    
    func areTabsVisible() {
        XCTAssertTrue(homeBtn.isHittable && searchBtn.isHittable
                      && uploadPostBtn.isHittable && notificationBtn.isHittable
                      && profileBtn.isHittable)
    }
    
    func goBack() {
        if (backButton.exists){
            backButton.tap()
        }
    }
    
    func clickTab(_ text: String){
//        var variableDictionary = [String: Any]()
//        print(variableDictionary)
//        variableDictionary["\(text)Btn"] = "\(text)Btn"
//        if let tabButton = variableDictionary["\(text)Btn"] as? XCUIElement {
//            print(tabButton)
//            tabButton.tap()
//        }
        switch text {
        case "home":
            homeBtn.tap()
        case "search":
            searchBtn.tap()
        case "uploadPost":
            uploadPostBtn.tap()
        case "notification":
            notificationBtn.tap()
        case "profile":
            profileBtn.tap()
        default:
            print("There is no such button")
        }
    }
}
