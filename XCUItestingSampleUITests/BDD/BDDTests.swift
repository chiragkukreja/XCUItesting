//
//  TestingSteps.swift
//  XCUItestingSampleUITests
//
//  Created by Kukreja, Chirag on 18/03/20.
//  Copyright © 2020 Paypal. All rights reserved.
//

import XCTest

class BDDTests: XCUITestingBase {

    func testTappingOnCurrencyInBDDStyle() {
        givenAppIsReady()
        whenITap(currency: .euroView)
        thenIShouldSeeUpdatedBaseCurrency(currency: .euroView)
    }
}
