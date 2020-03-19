//
//  TestingSteps.swift
//  XCUItestingSampleUITests
//
//  Created by Kukreja, Chirag on 18/03/20.
//  Copyright © 2020 Paypal. All rights reserved.
//

import XCTest

extension XCUITestingBase {
    
    // withiout Activity
//       func givenAppIsReady() {
//          assertTrue {
//               AppUI.baseCurrencyView.isStaticText
//               AppUI.unitedStatesDollarView.isStaticText
//           }
//       }
//
//       func whenITap(currency: AppUI) {
//           currency.element.tap()
//       }
//
//       func thenIShouldSeeUpdatedBaseCurrency(currency: AppUI) {
//          assertTrue {
//               AppUI.unitedStatesDollarView.isWithinTableCell
//               currency.isStaticText
//           }
//       }
    
    // with Activity
    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given App is ready ") { _ in
            assertTrue {
                AppUI.baseCurrencyView.isStaticText
                AppUI.unitedStatesDollarView.isStaticText
            }
        }
    }

    func whenITap(currency: AppUI) {
        XCTContext.runActivity(named: "When I tap \(currency.rawValue) ") { _ in
            currency.element.tap()
        }
    }

    func thenIShouldSeeUpdatedBaseCurrency(currency: AppUI) {
        XCTContext.runActivity(named: "Then I should see updated base Currency as \(currency.rawValue)") { _ in

            assertTrue {
                AppUI.unitedStatesDollarView.isWithinTableCell
                currency.isStaticText
            }

        }
    }
   
}
