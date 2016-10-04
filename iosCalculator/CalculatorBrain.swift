//
//  CalculatorBrain.swift
//  iosCalculator
//
//  Created by Kerui Huang on 10/4/16.
//  Copyright © 2016 Kerui Huang. All rights reserved.
//

import Foundation

func multiply
class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    private var operations: Dictionary<String, Operation> = [
        "pi" : Operation.Constant(M_PI), //M_PI,
        "e" : Operation.Constant(M_E),  //M_E,
        "√" : Operation.UnaryOperation(sqrt), //sqrt,
        "cos" : Operation.UnaryOperation(cos), //cos
        "+" : Operation.BinaryOperation({$0 + $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "*" : Operation.BinaryOperation({$0 * $1}),
        "/" : Operation.BinaryOperation({$0 / $1}),
        "=" : Operation.Equals
    ]
    
    private enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation ((Double, Double) -> Double)
        case Equals
    }
    
        
    
    
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation (let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals :
                executePendingBinaryOperation()

            }
            
        }
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double{
        get {
            return accumulator
        }
    }
}