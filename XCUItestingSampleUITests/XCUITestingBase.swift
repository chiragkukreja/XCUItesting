//
//  XCUITestingBase.swift
//  XCUItestingSampleUITests
//
//  Created by Kukreja, Chirag on 17/03/20.
//  Copyright © 2020 Paypal. All rights reserved.
//

import XCTest

class XCUITestingBase: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
        
    }
    
    func assertTrue(@BooleanFunctionBuilder builder: () -> [Bool] ) {
        let expressions = builder()
        expressions.forEach({XCTAssertTrue($0)})
    }
    
    func assertFalse(@BooleanFunctionBuilder builder: () -> [Bool] ) {
        let expressions = builder()
        expressions.forEach({XCTAssertFalse($0)})
    }
}
