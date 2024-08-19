//
//  LoginTest.swift
//  LoginUITests
//
//  Created by Adriano Valumin on 8/18/24.
//  Copyright © 2024 Gary Tokman. All rights reserved.
//

import XCTest

final class LoginTest: MainAppTests {
	let loginPage = LoginPage()

	func testExample() throws {
		loginPage.validateHomeText()
		loginPage.writeUserEmail()
		loginPage.writeUserPassword()
		loginPage.clickContinueButton()
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
