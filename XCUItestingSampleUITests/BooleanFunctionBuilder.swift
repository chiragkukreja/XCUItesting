//
//  BooleanFunctionBuilder.swift
//  XCUItestingSampleUITests
//
//  Created by Kukreja, Chirag on 18/03/20.
//  Copyright © 2020 Paypal. All rights reserved.
//

import XCTest

@_functionBuilder
class BooleanFunctionBuilder {
    static func buildBlock(_ children: Bool...) -> [Bool] {
        return children
    }    
}
