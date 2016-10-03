//
//  ViewController.swift
//  iosCalculator
//
//  Created by Kerui Huang on 10/3/16.
//  Copyright © 2016 Kerui Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display!.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        
    }

    @IBAction func pi(sender: UIButton) {
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "pi"{
                display.text = String(M_PI)
            }
        }
    }
}

