//
//  MainHelper.swift
//  LoginUITests
//
//  Created by Adriano Valumin on 8/18/24.
//  Copyright © 2024 Gary Tokman. All rights reserved.
//

import Foundation
import XCTest

class MainHelper: MainAppTests {
	let elementsQuery = XCUIApplication().scrollViews.otherElements
	let collectionView = XCUIApplication().collectionViews

	// MARK: - Wait

	func waitElement(element: Any,  timeout: TimeInterval = 10.0) {
		let exists = NSPredicate(format: "exists == 1")

		expectation(for: exists, evaluatedWith: element, handler: nil)
		waitForExpectations(timeout: timeout, handler: nil)
	}

	func waitMessage(message: String) {
		waitLoadingDissappear()

		let predicate = NSPredicate(format: "label CONTAINS[c] %@", message)
		let result = app.staticTexts.containing(predicate)
		let element = app.staticTexts[result.element.firstMatch.label]
		waitElement(element: element)
	}

	func waitLoadingDissappear() {
		sleep(2)
		let element = app.activityIndicators["Em andamento"]
		let exists = NSPredicate(format: "exists == 0")

		expectation(for: exists, evaluatedWith: element, handler: nil)
		waitForExpectations(timeout: 200.0, handler: nil)
	}

	func waitDuring(time: UInt32) {
		sleep(time)
	}

	func okButton() {
		let okButton = app.toolbars.buttons["OK"]
		okButton.tap()
	}

	// MARK: - Tap

	func tapElementButton(identifier: String) {
		let button = app.buttons[identifier]
		waitElement(element: button)
		button.tap()
	}

	func tapElementLabel(identifier: String) {
		let label = app.staticTexts[identifier]
		waitElement(element: label)
		label.tap()
	}

	func tapElementStaticText(identifier: String) {
		let label = app.staticTexts[identifier]
		waitElement(element: label)
		label.tap()
	}

	func tapTableStaticText(identifier: String) {
		let label = app.tables.staticTexts[identifier]
		waitElement(element: label)
		label.tap()
	}

	func tapCellWithText(text: String) {
		waitLoadingDissappear()
		let searchedCell = app.cells.containing(
			NSPredicate(format: "label CONTAINS %@", text)
		).element
		searchedCell.firstMatch.tap()
		waitLoadingDissappear()
	}

	func tapStaticText(identifier: String) {
		waitElement(element: elementsQuery.staticTexts[identifier])
		elementsQuery.staticTexts[identifier].tap()
	}

	func tapCollectionStaticText(identifier: String) {
		waitElement(element: collectionView.staticTexts[identifier])
		collectionView.staticTexts[identifier].tap()
	}

	func sendKeysTextField(identifier: String, value: String) {
		let element = elementsQuery.textFields[identifier]
		element.tap()
		element.typeText(value)
	}

	func sendKeysSecureTextField(identifier: String, value: String) {
		let element = elementsQuery.secureTextFields[identifier]
		element.tap()
		element.typeText(value)
	}

	func clickAgreement(identifier: String) {
		let element = app.scrollViews.otherElements[identifier]
		element.tap()
	}

	// MARK: - Write

	func getTextFieldValue(identifier: String) -> String {
		let element = app.textFields[identifier]
		element.tap()
		return element.firstMatch.value as! String
	}

	func deleteTextFieldValue(identifier: String) {
		let textFieldValue = getTextFieldValue(identifier: identifier)
		for i in 0..<textFieldValue.count {
			app.keys["delete"].tap()
		}
	}

	func sendKeysNamesTextField(identifier: String, value: String) {
		let element = app.textFields[identifier]
		element.tap()
		element.typeText(value)
		element.typeText("\n")
	}

	func sendKeysNameTextView(identifier: String, value: String) {
		let element = app.textViews[identifier]
		element.tap()
		element.typeText(value)
		element.typeText("\n")
	}

	func sendKeysNameTextWithoutEnter(identifier: String, value: String) {
		let element = app.textViews[identifier]
		element.tap()
		element.typeText(value)
	}

	func sendNumberKeyboard(number: String) {
		let element = app.keys[number]
		waitElement(element: element)
		element.tap()
	}

	func skipScreen(page: String, identifier: String) {
		if app.buttons[page].exists {
			waitLoadingDissappear()

			let alert = app.alerts.firstMatch
			if alert.exists {
				alert.buttons["Allow"].tap()
			}
			waitLoadingDissappear()
			tapElementButton(identifier: identifier)
		}
	}

	func swipeToButton() {
		let scroll = app.scrollViews.element
		scroll.swipeDown()
	}

	// MARK: - Check

	func checkBtnExist(identifier: String) {
		let button = app.buttons[identifier]
		waitElement(element: button)
		XCTAssert(button.exists)
	}

	func checkTextExist(identifier: String) {
		let text = app.staticTexts[identifier]
		waitElement(element: text)
		XCTAssert(text.exists)
	}

	func checkTextFieldExist(identifier: String) {
		let textField = app.textFields[identifier]
		waitElement(element: textField)
		XCTAssert(textField.exists)
	}
}
