//
//  CalculatorBrain.swift
//  iosCalculator
//
//  Created by Kerui Huang on 10/4/16.
//  Copyright © 2016 Kerui Huang. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private var accumulator = 0.0
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    func performOperation(symbol: String){
        switch symbol {
        case "pi": accumulator = M_PI
        case "√" : accumulator = sqrt(accumulator)
        default: break
        }
    }
    var result: Double{
        get {
            return accumulator
        }
    }
}