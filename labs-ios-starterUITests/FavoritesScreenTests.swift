//
//  FavoritesScreenTests.swift
//  labs-ios-starterUITests
//
//  Created by Fabiola S on 2/23/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import XCTest

/// Tests for Favorites Screen UI elements
class FavoritesScreenTests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        app.buttons["skipOkta"].tap()
        app.buttons["favoritesButton"].tap()
    }
    
    /// Checks existence of UI elements
    func testUIElements() {
        XCTAssertTrue(app.buttons["backToSearch"].waitForExistence(timeout: 2),
                      "Back to search screen button exists")
        XCTAssertTrue(app.maps.element.waitForExistence(timeout: 2),
                      "Map view exists")
        XCTAssertTrue(app.staticTexts["cityLabel"].waitForExistence(timeout: 2),
                      "City label exists")
        XCTAssertTrue(app.buttons["favoriteButton"].waitForExistence(timeout: 2),
                      "Favorite button exists")
        XCTAssertTrue(app.staticTexts["livabilityLabel"].waitForExistence(timeout: 2),
                      "Livability label exists")
        XCTAssertTrue(app.staticTexts["walkabilityLabel"].waitForExistence(timeout: 2),
                      "Walkability label exists")
        XCTAssertTrue(app.staticTexts["incomeLabel"].waitForExistence(timeout: 2),
                      "Average income label exists")
    }

}
