//
//  LoginTest.swift
//  LoginUITests
//
//  Created by Adriano Valumin on 8/18/24.
//  Copyright © 2024 Gary Tokman. All rights reserved.
//

import XCTest

final class LoginTest: MainAppTests {

    func testExample() throws {
        // UI tests must launch the application that they test.
		var component: XCUIElement
		component = app.staticTexts["welcome_txt"]
		XCTAssertTrue(component.exists)
		app.textFields["login_username"].tap()
		app.textFields["login_username"].typeText("test_username")
		app.textFields["login_password"].tap()
		app.textFields["login_password"].typeText("test_password")
		app.buttons["login_button"].tap()
		sleep(5)

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
