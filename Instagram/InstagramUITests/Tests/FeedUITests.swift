
import Foundation
import XCTest

class FeedUITests: BaseTest{
    
    let loginScreen = LoginScreen()
    let forgetPassScreen = ForgetPasswordScreen()
    let feedScreen = FeedScreen()
    let searchScreen = SearchScreen()
    let uploadPostScreen = UploadPostScreen()
    let notificationsScreen = NotificationScreen()
    let profileScreen = ProfileScreen()
    
    override class func setUp() {
        super.setUp()
        BaseTest().app.launch()
//        let attachment = XCTAttachment(screenshot: BaseTest().app.screenshot())
        
        LoginScreen().enterUsername(username: "test")
        LoginScreen().enterPassword(password: "test@123")
        LoginScreen().tapLoginBtn()
        sleep(2)
        if(LoginScreen().isWrongUserPassVisible()){
            repeat {
                LoginScreen().clickOK()
                sleep(2)
                LoginScreen().tapLoginBtn()
            } while LoginScreen().isWrongUserPassVisible()
        }
    }

    func test1FeedTabs() throws {
        feedScreen.areTabsVisible();
    }
    
    func test2AllTabScreens(){
        searchScreen.clickTab("search")
        XCTAssertTrue(feedScreen.isStaticTextVisible("Search"))

        feedScreen.clickTab("home")
        XCTAssert(searchScreen.isStaticTextVisible("Feed"))
        searchScreen.clickTab("uploadPost")
        XCTAssertTrue(feedScreen.isStaticTextVisible("Upload Post"))

        feedScreen.clickTab("home")
        XCTAssert(searchScreen.isStaticTextVisible("Feed"))
        searchScreen.clickTab("notification")
        XCTAssertTrue(feedScreen.isStaticTextVisible("Notifications"))

        feedScreen.clickTab("home")
        XCTAssert(searchScreen.isStaticTextVisible("Feed"))
        searchScreen.clickTab("profile")
        XCTAssertTrue(feedScreen.isStaticTextVisible("Profile"))
        feedScreen.clickTab("home")
    }
    
    func test3Swipes(){
        feedScreen.swipeUp()
        feedScreen.swipeUp()
        feedScreen.swipeUp()
        feedScreen.swipeDown()
        feedScreen.swipeUp()
        feedScreen.swipeUp()
    }

}
