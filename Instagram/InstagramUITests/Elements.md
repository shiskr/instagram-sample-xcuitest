#  <#Title#>

app.alerts.element
app.buttons.element
app.collectionViews.element
app.images.element
app.maps.element
app.navigationBars.element
app.pickers.element
app.progressIndicators.element
app.scrollViews.element
app.segmentedControls.element
app.staticTexts.element
app.switches.element
app.tabBars.element
app.tables.element
app.textFields.element
app.textViews.element
app.webViews.element



XCTest gives us five different ways to trigger taps on elements:

tap() triggers a standard tap, which will trigger buttons or active text fields for editing.
doubleTap() taps twice in quick succession.
twoFingerTap() uses two fingers to tap once on an element.
tap(withNumberOfTaps:numberOfTouches:) lets you control tap and touch count at the same time.
press(forDuration:) triggers long presses over a set number of seconds.



There are also specific methods for gesture control:

swipeLeft(), swipeRight(), swipeUp(), and swipeDown() execute single swipes in a specific direction, although there is no control over speed or distance.
pinch(withScale:velocity:) pinches and zooms on something like a map. Specify scales between 0 and 1 to zoom out, or scales greater than 1 to zoom in. Velocity is specified as “scale factor per second” and causes a little overscroll after you zoom – use 0 to make the zoom precise.
rotate(_: withVelocity:) rotates around an element. The first parameter is a CGFloat specifying an angle in radians, and the second is radians per second.




Typing text
You can activate a text field and type individual letters in the keyboard:

app.textFields.element.tap()
app.keys["t"].tap()


XCTAssertEqual(app.buttons.element.title, "Buy")
XCTAssertEqual(app.staticTexts.element.label, "test")



let screenshot = app.screenshot()
let attachment = XCTAttachment(screenshot: screenshot)
attachment.name = "My Great Screenshot"
attachment.lifetime = .keepAlways
add(attachment)





tests:
1. login user and verify feed after login : Done
2. forget password button and new screen text : Done
3. login user & verify tabs present and their respective text in screen
4. login user & scroll over the feed, verify username1, profile icon and click on like, comment, share for each photo, alongwith time posted("Just now") & end of feed is "No more items"
