//
//  batonnetsUITests.swift
//  batonnetsUITests
//
//  Created by imac on 14/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import XCTest

class batonnetsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        
        let newGameButton = app.buttons["new-game-button"]
        let playerLabel = app.staticTexts["current_player"]
        let matchesLabel = app.staticTexts["matches_count"]
        
        XCTAssertFalse(newGameButton.exists, "At launch a new game is autmatically started, the begin button should not be visible")
        
        XCTAssertEqual(playerLabel.label, "Joueur 1")
        XCTAssertEqual(matchesLabel.label, "20")
        app.buttons["3"].tap()
        XCTAssertEqual(playerLabel.label, "Joueur 2")
        XCTAssertEqual(matchesLabel.label, "17")
        app.buttons["2"].tap()
        XCTAssertEqual(playerLabel.label, "Joueur 1")
        XCTAssertEqual(matchesLabel.label, "15")
        app.buttons["1"].tap()
        XCTAssertEqual(matchesLabel.label, "14")
        
        app.buttons["3"].tap()
        app.buttons["3"].tap()
        app.buttons["3"].tap()
        app.buttons["3"].tap() //2 marches left after this
        
        XCTAssertFalse(app.buttons["3"].exists, "This button should not be displayed if there is less than 3 matches left")
        XCTAssert(app.buttons["2"].exists)
        XCTAssert(app.buttons["1"].exists)
        app.buttons["1"].tap()
        
        XCTAssertFalse(app.buttons["3"].exists)
        XCTAssertFalse(app.buttons["2"].exists)
        XCTAssert(app.buttons["1"].exists)
        app.buttons["1"].tap()
        
        XCTAssertEqual(playerLabel.label, "Joueur 2 a gagné")
        XCTAssertFalse(app.buttons["3"].exists)
        XCTAssertFalse(app.buttons["2"].exists)
        XCTAssertFalse(app.buttons["1"].exists)
        XCTAssertTrue(newGameButton.exists, "At the end of a game, the new game button should be displayed")
        
        newGameButton.tap()
        XCTAssertFalse(newGameButton.exists, "On click, the button should disappear when the new game starts")
        XCTAssert(app.buttons["3"].exists)
        XCTAssert(app.buttons["2"].exists)
        XCTAssert(app.buttons["1"].exists)
        XCTAssertEqual(playerLabel.label, "Joueur 1")
        XCTAssertEqual(matchesLabel.label, "20")
        
        
    }
    
}
