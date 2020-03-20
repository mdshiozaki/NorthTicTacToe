//
//  NorthTicTacToeUITests.swift
//  NorthTicTacToeUITests
//
//  Created by Mshiozaki on 2020-03-19.
//  Copyright © 2020 Michael Shiozaki. All rights reserved.
//

// *** No actual tests were written, became confused with UI elements and how to identify and spent too much time here

import XCTest

class NorthTicTacToeUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launch()
    }

    func testTileUpdate() {
        // given
        
        // when
        XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).matching(identifier: "Button").element(boundBy: 1).tap()

        // then
        // *** I don't know how to identify the button to assert that it has become a cross given the above info from recording...
        
        
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
