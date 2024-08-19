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
		let identifier = "welcome_txt"
		helper.checkTextExist(identifier: identifier)
	}

	func writeUserEmail() {
		let identifier = "login_username"
		let inputValue = "adriano.valumin@outlook.com"
		helper.checkTextFieldExist(identifier: identifier)
		helper
			.sendKeysNamesTextField(
				identifier: identifier,
				value: inputValue
			)
		let fieldValue = helper.getTextFieldValue(identifier: identifier)
		XCTAssertEqual(fieldValue, inputValue)
	}

	func writeUserPassword() {
		let identifier = "login_password"
		helper.checkTextFieldExist(identifier: identifier)
		helper.sendKeysNamesTextField(identifier: identifier, value: "123456")
		let fieldValue = helper.getTextFieldValue(identifier: identifier)
		XCTAssertEqual(fieldValue, "123456")
	}

	func clickContinueButton() {
		let idenfitier = "login_button"
		helper.checkBtnExist(identifier: idenfitier)
		helper.checkButtonIsEnabled(identifier: idenfitier)
		helper.tapElementButton(identifier: idenfitier)
	}
}
