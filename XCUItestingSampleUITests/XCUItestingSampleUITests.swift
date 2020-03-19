//
//  XCUItestingSampleUITests.swift
//  XCUItestingSampleUITests
//
//  Created by Kukreja, Chirag on 12/03/20.
//  Copyright © 2020 Paypal. All rights reserved.
//

import XCTest

class XCUItestingSampleUITests: XCUITestingBase {

    func testInitialState() {
        XCTAssertTrue(app.staticTexts["Base Currency"].exists)
        XCTAssertTrue(app.staticTexts["United States Dollar"].exists)
        XCTAssertTrue(app.textFields["1"].exists)
        
        //After Modification
        
        XCTAssertTrue(AppUI.baseCurrencyView.isStaticText)
        XCTAssertTrue(AppUI.unitedStatesDollarView.isStaticText)
        XCTAssertTrue(AppUI.initialTextField.isTextField)
        
        // Using function Builder
        assertTrue {
            AppUI.baseCurrencyView.isStaticText
            AppUI.unitedStatesDollarView.isStaticText
            AppUI.initialTextField.isTextField
        }
    }
    
    func testUpdatingBaseCurrencyCell() {
        // Initial Test
//        XCTAssertTrue(AppUI.unitedStatesDollarView.isStaticText)
//        app.tables.cells.element(boundBy: 2).tap()
//        XCTAssertTrue(AppUI.euroView.isStaticText)
        
        // After Modification
        XCTAssertTrue(AppUI.unitedStatesDollarView.isStaticText)
        XCTAssertTrue(AppUI.euroView.isWithinTableCell)
        AppUI.euroView.element.tap()
        XCTAssertTrue(AppUI.unitedStatesDollarView.isWithinTableCell)
        XCTAssertTrue(AppUI.euroView.isStaticText)
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
