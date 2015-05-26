//
//  Calculator.swift
//  FlatCalc
//
//  Created by Nikolas Gelo on 3/4/15.
//  Copyright (c) 2015 Nikolas Gelo. All rights reserved.
//

import UIKit

enum Operator {
    case Addition
    case Subtraction
    case Multiplication
    case Division
}

class Calculator: NSObject {
    
    // MARK: Managing the Result
    
    var result: NSNumber = 0.0
    var resultIsNegative = false
    
    func clearResult() {
        result = 0
        savedOperator = 0
    }
    
    func flipResultSign() {
        result = -result.floatValue
    }
    
    // MARK: Operands and Operators
    
    private var savedOperator = 0
    
    func appendDigitToOperand(digit: Int) {
        result = result.floatValue * 10 + Float(digit)
    }
}
