//
//  MapScreenUITests.swift
//  labs-ios-starterUITests
//
//  Created by Fabiola S on 2/23/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import XCTest

/// Tests for Map Screen UI elements
class MapScreenUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testUIElements() {
        XCTContext.runActivity(named: "Setup Screens") { _ in
            setupScreens()
        }
        
        XCTAssertTrue(app.buttons["backToSearch"].waitForExistence(timeout: 2),
                      "Search button exists")
        XCTAssertTrue(app.maps.element.waitForExistence(timeout: 2),
                      "Map view exists")
        XCTAssertTrue(app.buttons["favoritesButton"].waitForExistence(timeout: 2),
                      "Favorite button exists")
        
        XCTAssertTrue(app.staticTexts["cityLabel"].waitForExistence(timeout: 2),
                      "City label exists")
        let cityLabelElement = app.staticTexts["cityLabel"]
        XCTAssertEqual("New York", cityLabelElement.label)
        
        XCTAssertTrue(app.buttons["employmentIcon"].waitForExistence(timeout: 2),
                      "Employment button exists")
        XCTAssertTrue(app.buttons["walkabilityButton"].waitForExistence(timeout: 2),
                      "Walkability button exists")
        XCTAssertTrue(app.buttons["incomeButton"].waitForExistence(timeout: 2),
                      "Income button exists")
        XCTAssertTrue(app.buttons["incomeButton"].waitForExistence(timeout: 2),
                      "Income button exists")
        XCTAssertTrue(app.buttons["ageButton"].waitForExistence(timeout: 2),
                      "Average age button exists")
        XCTAssertTrue(app.buttons["livabilityButton"].waitForExistence(timeout: 2),
                      "Livability button exists")
        XCTAssertTrue(app.buttons["rentalButton"].waitForExistence(timeout: 2),
                      "Rental button exists")
    }

    /// Sets the search term to get to map view
    func setupScreens() {
        app.launch()
        app.buttons["skipOkta"].tap()
        let searchElement = app.searchFields["Search for your new home"]
        searchElement.tap()
        
        app.typeText("New York\n")
    }

}
