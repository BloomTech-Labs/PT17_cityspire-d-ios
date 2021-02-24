//
//  LoginScreenTests.swift
//  labs-ios-starterUITests
//
//  Created by Fabiola S on 2/22/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import XCTest

/// Tests for Login Screen UI elements
class LoginScreenTests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    /// Tests that UI elements appear on the screen
    func testUIElements() {
        XCTAssertTrue(app.images["mapBackground"].waitForExistence(timeout: 2),
                      "Map background should be visible")
        XCTAssertTrue(app.images["cityScapeLogo"].waitForExistence(timeout: 2),
                      "Logo should be visible")
        XCTAssertTrue(app.buttons["signInButton"].waitForExistence(timeout: 2),
                      "Sign in button should be visible")
    }

}
