//
//  LoginPage.swift
//  LoginUITests
//
//  Created by Adriano Valumin on 8/18/24.
//  Copyright © 2024 Gary Tokman. All rights reserved.
//

import Foundation
import XCTest

class LoginPage {
	let helper = MainUIHelper()

	func validateHomeText() {
		helper.checkTextExist(identifier: "welcome_txt")
	}

	func writeUserEmail() {
		helper.checkTextFieldExist(identifier: "login_username")
		helper.sendKeysNamesTextField(identifier: "login_username", value: "adriano.valumin@outlook.com")
		let fieldValue = helper.getTextFieldValue(identifier: "login_username")
		XCTAssertEqual(fieldValue, "adriano.valumin@outlook.com")
	}

	func writeUserPassword() {
		helper.checkTextFieldExist(identifier: "login_password")
		helper.sendKeysNamesTextField(identifier: "login_password", value: "123456")
		let fieldValue = helper.getTextFieldValue(identifier: "login_password")
		XCTAssertEqual(fieldValue, "123456")
	}

	func clickContinueButton() {
		helper.checkBtnExist(identifier: "login_button")
		helper.tapElementButton(identifier: "login_button")
	}

}
