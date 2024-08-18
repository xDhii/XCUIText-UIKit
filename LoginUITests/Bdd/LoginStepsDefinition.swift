//
//  LoginStepsDefinition.swift
//  LoginUITests
//
//  Created by Adriano Valumin on 8/18/24.
//  Copyright © 2024 Gary Tokman. All rights reserved.
//

import XCTest

protocol login {
	func testSuccessLogin()
}

extension SetupTestBase {
	func givenTheUserInsertsTheCorrectCredentials() {
		XCTContext.runActivity(named: "Given the user inserts the correct credentials") { _ in
			helper.checkTextFieldExist(identifier: "login_username")
			helper.sendKeysNamesTextField(identifier: "login_username", value: "adriano.valumin@outlook.com")
			var fieldValue = helper.getTextFieldValue(identifier: "login_username")
			XCTAssertEqual(fieldValue, "adriano.valumin@outlook.com")

			helper.checkTextFieldExist(identifier: "login_password")
			helper.sendKeysNamesTextField(identifier: "login_password", value: "123456")
			fieldValue = helper.getTextFieldValue(identifier: "login_password")
			XCTAssertEqual(fieldValue, "123456")
		}
	}

	func whenTheUserTapsTheLoginButton() {
		XCTContext.runActivity(named: "When the user taps the login button") { _ in
			helper.checkBtnExist(identifier: "login_button")
			helper.tapElementButton(identifier: "login_button")
		}
	}

	func thenTheLoginScreenIsVisible() {
		XCTContext.runActivity(named: "Then the login screen is visible") { _ in
			helper.checkTextExist(identifier: "welcome_tx1231t")
		}
	}
}
