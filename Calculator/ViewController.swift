//
//  ViewController.swift
//  Calculator
//  App Name: Arithmetic Calculator
//  Created by Supriya Gadkari on 09/27/20.
//  Student ID: 301140872
//  App Description: A Simple arithmetic calculator built using storyboard UI and swift
//  App version: 0.1
//  XCode version: 12.0.1

import UIKit

class ViewController: UIViewController {
  
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onNumberButton_Pressed(_ sender: UIButton) {
        
        print(sender.titleLabel!.text!);
        if(resultLabel.text! == "0") {
            resultLabel.text! = sender.titleLabel!.text!
        }
        else {
            resultLabel.text! += sender.titleLabel!.text!
        }
    }
    

    @IBAction func onArithmethicButton_Pressed(_ sender: UIButton) {
        //print(sender.titleLabel!.text!);
        
        switch sender.titleLabel!.text! {
        case "C":
            resultLabel.text! = "0"
        case "+":
            resultLabel.text! = "+"
        default:
            resultLabel.text! += sender.titleLabel!.text!
        }
        
        
        
    }
    
}
