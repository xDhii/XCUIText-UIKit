//
//  TestBddExample.swift
//  LoginUITests
//
//  Created by Adriano Valumin on 8/18/24.
//  Copyright © 2024 Gary Tokman. All rights reserved.
//

import Foundation

class TestBddExample: SetupTestBase, login {

	func testSuccessLogin() {
		givenTheUserInsertsTheCorrectCredentials()
		whenTheUserTapsTheLoginButton()
		thenTheLoginScreenIsVisible()
	}

}
