//
//  ElementType.swift
//  XCUItestingSampleUITests
//
//  Created by Kukreja, Chirag on 18/03/20.
//  Copyright © 2020 Paypal. All rights reserved.
//

import XCTest

enum ElementType {
    case textfield
    case statictext
    case tableCelltext
    
    init?(_ text: String) {
        if XCUIApplication().tables.cells.staticTexts[text].exists {
        self  = .tableCelltext
        } else if XCUIApplication().textFields[text].exists {
            self = .textfield
        } else if XCUIApplication().staticTexts[text].exists {
            self = .statictext
        } else {
            return nil
        }
    }
}

extension ElementType {
    func getElement(with text: String) -> XCUIElement {
        switch  self {
        case .statictext:
            return XCUIApplication().staticTexts[text]
        case .textfield:
            return XCUIApplication().textFields[text]
        case .tableCelltext:
            return XCUIApplication().tables.cells.staticTexts[text]
        }
    }
}
