//
//  CalculatorButton.swift
//  FlatCalc
//
//  Created by Nikolas Gelo on 3/4/15.
//  Copyright (c) 2015 Nikolas Gelo. All rights reserved.
//

import UIKit

class CalculatorButton: UIButton {
    
    @IBInspectable var normalColor: UIColor = UIColor.whiteColor() {
        didSet {
            backgroundColor = normalColor
        }
    }

    @IBInspectable var selectedColor: UIColor = UIColor.grayColor()
    
    var showSelectedBorder: Bool = false {
        didSet {
            if showSelectedBorder {
                self.layer.borderColor = UIColor.blackColor().CGColor
                self.layer.borderWidth = 1.5
            } else {
                self.layer.borderColor = nil
                self.layer.borderWidth = 0
            }
        }
    }
    
    // MARK: - UIControl
    // MARK: Setting and Getting Control Attributes
    
    override var highlighted: Bool {
        didSet {            
            // Set the appropriate background color.
            if highlighted {
                backgroundColor = selectedColor
            } else {
                // Animate the background color change. This is what happens in
                // the Calculator app in iOS 8.
                UIView.animateWithDuration(0.35, animations: { () -> Void in
                    self.backgroundColor = self.normalColor
                })
            }
        }
    }
}
