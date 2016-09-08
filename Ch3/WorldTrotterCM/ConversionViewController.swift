//
//  ConversionViewController.swift
//  WorldTrotterCM
//
//  Created by Christopher Myers on 9/6/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel : UILabel!
    @IBOutlet var textField : UITextField!
    
    var fahrenheitValue : Double? {
        didSet{
            updateCelsiusLabel()
        }
    }
    var celsiusValue : Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute], fromDate: date)
        
        let hour = components.hour
        let minute = components.minute
        print(hour)
        print(minute)
        
        if hour > 7 && hour < 20 {
            view.backgroundColor = UIColor.greenColor()
        }
        else {
            view.backgroundColor = UIColor.grayColor()
        }

    }
    
    
    let numberFormatter : NSNumberFormatter = {
       let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        //print ("Current text: \(textField.text)")
        //print ("Replacement text: \(string)")
        
        // MARK : Bronze Challenge - Chapter 4
        
        let existingAlpha = textField.text?.rangeOfCharacterFromSet (NSCharacterSet.letterCharacterSet())
        let replacementAlpha = string.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet())
        
        if existingAlpha != nil && replacementAlpha != nil {
            return false
        } 
        

        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
            
        } else {
            return true
        }
        
    }
    
    @IBAction func dismissKeyboard(sender : AnyObject) {
        textField.resignFirstResponder()
    }
    
    @IBAction func fahrenheitFieldEditingChanged (textField : UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
        
        
    }
    
}
