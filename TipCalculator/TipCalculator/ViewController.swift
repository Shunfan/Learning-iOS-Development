//
//  ViewController.swift
//  TipCalculator
//
//  Created by Shunfan Du on 9/19/15.
//  Copyright © 2015 Shunfan Du. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var tipLabels: UIStackView!
    @IBOutlet weak var tip15Label: UILabel!
    @IBOutlet weak var tip17Label: UILabel!
    @IBOutlet weak var tip20Label: UILabel!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipLabels.hidden = true
        
        amountTextField.delegate = self
        
        tip15Label.adjustsFontSizeToFitWidth = true
        tip17Label.adjustsFontSizeToFitWidth = true
        tip20Label.adjustsFontSizeToFitWidth = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        let amount = NSString(string: amountTextField.text!).doubleValue
        
        calculateTip(amount)
        
        return true
    }
    
    func calculateTip(amount: Double) {
        let tip15 = amount * 0.15
        let tip17 = amount * 0.17
        let tip20 = amount * 0.20
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        tip15Label.text = numberFormatter.stringFromNumber(tip15)
        tip17Label.text = numberFormatter.stringFromNumber(tip17)
        tip20Label.text = numberFormatter.stringFromNumber(tip20)
        
        tipLabels.hidden = false
    }
}
