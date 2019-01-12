//
//  ViewController.swift
//  Calculator_2.10
//
//  Created by James Chun on 1/6/19.
//  Copyright © 2019 James Chun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "0";
        
        //in viewDidLoad
        let application: UIApplication = .shared;   //type property
        
        if let appDelegate: AppDelegate = application.delegate as? AppDelegate {
            if let window: UIWindow = appDelegate.window {
                window.backgroundColor = .purple;
            }
        }
    }

    @IBAction func clear(_ sender: UIButton) {
        label.text = "0";
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        if let titleLabel: UILabel = sender.titleLabel {
            if let digit: String = titleLabel.text {
                if label.text == "0" {
                    label.text = "";
                }
                label.text! += digit;
            }
        }
    }
    
    @IBAction func decimalPointPressed(_ sender: UIButton) {
        if label.text == "0" {
            label.text = "";
        }
        label.text! += ".";
    }
    
    @IBAction func operatorKeyPressed(_ sender: UIButton) {
        if let titleLabel: UILabel = sender.titleLabel {
            if let myOperator: String = titleLabel.text {
                label.text! += myOperator;
            }
        }
    }
    
    @IBAction func equalKeyPressed(_ sender: UIButton) {
        var s: String = label.text!;
        s = s.replacingOccurrences(of: "−", with: "-");
        s = s.replacingOccurrences(of: "×", with: "*");
        s = s.replacingOccurrences(of: "÷", with: ".0/");   //avoid Int division
        
        //Not attempting to detect syntax errors; would require Objective-C.
        let expression: NSExpression = NSExpression(format: s);
        if let result: NSNumber = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            if let text: String = label.text {
                label.text = text + "\n" + result.stringValue
            } else {
                label.text = result.stringValue
            }
        }
    }
}

