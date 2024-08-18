//
//  LoginExample.swift
//  LoginUITests
//
//  Created by Adriano Valumin on 8/17/24.
//  Copyright © 2024 Gary Tokman. All rights reserved.
//

import XCTest

final class LoginExample: XCTestCase {
	let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.

        app.launch()
		app.textFields["login_username"].tap()
		app.textFields["login_username"].typeText("test_username")
		app.textFields["login_password"].tap()
		app.textFields["login_password"].typeText("test_password")
		app.buttons["login_button"].tap()
		sleep(5)

		app.terminate()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
