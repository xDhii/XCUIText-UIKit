//
//  LoginTests.swift
//  LoginUITests
//
//  Created by Adriano Valumin on 8/18/24.
//  Copyright © 2024 Gary Tokman. All rights reserved.
//

import XCTest

class MainAppTests: XCTestCase {
	let app = XCUIApplication()

	override func setUp() {
		super.setUp()
		continueAfterFailure = false
		app.launch()
	}

	override func tearDown() {
		super.tearDown()
		app.terminate()
	}



}
