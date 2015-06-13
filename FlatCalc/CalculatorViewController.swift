//
//  CalculatorViewController.swift
//  FlatCalc
//
//  Created by Nikolas Gelo on 3/4/15.
//  Copyright (c) 2015 Nikolas Gelo. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: Managing the Calculator
    
    let calculator: Calculator = Calculator()
    
    // MARK: Entering Numbers
    
    @IBAction func appendDigit(button: UIButton) {
        println("Number \(button.currentTitle!) pressed")
        
        // Allow max of 9 digits to be entered.
        //
        // TODO: Does not handle decimal value.
        if calculator.result.floatValue < 100000000 && calculator.result.floatValue > -100000000 {
            let digitToAppend = button.currentTitle!.toInt()
            calculator.appendDigitToOperand(digitToAppend!)
            updateResultLabel()
        }
    }
    
    // MARK: Managing and Manipulating the Result
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var clearResultButton: UIButton!
    
    let resultFormatter = NSNumberFormatter()
    
    @IBAction func clearResult(clearResultButton: UIButton) {
        calculator.clearResult()
        updateResultLabel()
    }
    
    @IBAction func flipResultSign(button: UIButton) {
        calculator.flipResultSign()
        updateResultLabel()
    }
    
    @IBAction func convertResultToPercentage(button: UIButton) {
        // TODO: Still needs refining. Goes to 0 successive presses.
        calculator.result = NSNumber(double: Double(calculator.result.doubleValue / 100.0))
        updateResultLabel()
    }
    
    func updateResultLabel() {
        resultLabel.text = resultFormatter.stringFromNumber(calculator.result)
    }
    
    // MARK: Performing Calculations
    
    @IBAction func performCalculation(button: CalculatorButton) {
        button.showSelectedBorder = !button.showSelectedBorder
    }
    
    // MARK: - UIViewController
    // MARK: Managing the View

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the number formatter.
        resultFormatter.numberStyle = .DecimalStyle
//        resultFormatter.maximumSignificantDigits = 8
    }
    
    // MARK: Managing the Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
