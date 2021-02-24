//
//  SearchScreenTests.swift
//  labs-ios-starterUITests
//
//  Created by Fabiola S on 2/22/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import XCTest

/// Tests for Search Screen UI elements
class SearchScreenTests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        app.buttons["skipOkta"].tap()
    }

    /// Checks existence of UI elements
    func testSearchScreenElements() {
        XCTAssertTrue(app.buttons["favoritesButton"].waitForExistence(timeout: 2),
                      "Favorites button should be visible")
        
        XCTAssertTrue(app.staticTexts["mainTitle"].waitForExistence(timeout: 2),
                      "Main title should be visible")
        XCTAssertTrue(app.textViews["lowerTitle"].waitForExistence(timeout: 2),
                      "Lower title should be visible")
        
        XCTAssertTrue(app.searchFields["Search for your new home"].waitForExistence(timeout: 2),
                      "Search field should be visible")
        
        XCTAssertTrue(app.otherElements["cardView"].waitForExistence(timeout: 2),
                      "UIView with rounded corners should be visible")
        XCTAssertTrue(app.images["touristMap"].waitForExistence(timeout: 2),
                      "Tourist map image should be visible")
    }
    
    /// Checks that texts are correct
    func testText() {
        let mainTitleElement = app.staticTexts["mainTitle"]
        XCTAssertEqual("Great experiences are just around the corner", mainTitleElement.label, "Title should say 'Great experiences are just around the corner'" )
        
        let lowerTitleElement = app.staticTexts["lowerTitle"]
        let comparableString = lowerTitleElement.value as! String
        XCTAssertEqual("Let's start with where do you see yourself next? ", comparableString)
        
        let searchTextElement = app.searchFields["Search for your new home"]
        XCTAssertEqual("Search for your new home", searchTextElement.placeholderValue)
    }
    
    /// Wait for map screen to appear
    func testSearch() {
        let searchElement = app.searchFields["Search for your new home"]
        searchElement.tap()
        
        app.typeText("New York\n")
        
        XCTAssertTrue(app.maps.element.waitForExistence(timeout: 2))
        
    }
}
