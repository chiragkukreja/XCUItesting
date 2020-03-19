//
//  AppUI.swift
//  XCUItestingSampleUITests
//
//  Created by Kukreja, Chirag on 17/03/20.
//  Copyright © 2020 Paypal. All rights reserved.
//

import XCTest

enum AppUI: String {
    case baseCurrencyView = "Base Currency"
    case unitedStatesDollarView = "United States Dollar"
    case euroView = "Euro"
    case canadianDollar = "Canada Dollar"
    case singaporeDollar = "Singapore Dollar"
    case initialTextField = "1"
}


extension AppUI {
    
//    var isStaticText: Bool {
//        return XCUIApplication().staticTexts[self.rawValue].exists
//    }
//
//    var isTextField: Bool {
//        return XCUIApplication().textFields[self.rawValue].exists
//    }
}

extension AppUI {
//    var isWithinTableCell: Bool {
//        return XCUIApplication().tables.cells.staticTexts[self.rawValue].exists
//    }
    
    //initial implementation
//    var element: XCUIElement {
//        
//        if self.isStaticText {
//            return XCUIApplication().staticTexts[self.rawValue]
//        } else if self.isTextField {
//            return XCUIApplication().textFields[self.rawValue]
//        } else if self.isWithinTableCell {
//            return XCUIApplication().tables.cells.buttons[self.rawValue]
//        }
//        fatalError()
//    }
}

//After Modification
extension AppUI {
    var type: ElementType {
        guard let type = ElementType(self.rawValue) else { fatalError() }
        return type
    }
    
    // After Modification
    var element: XCUIElement {
        return type.getElement(with: self.rawValue)
    }
}

// After Modification

extension AppUI {

    var isStaticText: Bool {
        return type == .statictext
    }
    var isTextField: Bool {
        return type == .textfield
    }
    var isWithinTableCell: Bool {
        return type == .tableCelltext
    }
}
