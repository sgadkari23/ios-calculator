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
  
    
    var operator1:Double=0.0;
    var operator2:Double=0.0;
    var activeOperator1:String="";
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onNumberButton_Pressed(_ sender: UIButton) {
        
        print(sender.titleLabel!.text!);
        
        switch sender.titleLabel!.text! {
        case ".":
            if (!resultLabel.text!.contains(".")) {
                resultLabel.text! += "."
            }
        case "C":
            resultLabel.text! = "0"
        case "⌫":
            if (resultLabel.text!.count <= 1) || (resultLabel.text! == "-")
            {
                resultLabel.text! = "0"
            }else{
                resultLabel.text!.popLast()
            }
        case "+/-":
            if(resultLabel.text! != "0")
            {
                if (!resultLabel.text!.contains("-")) {
                    resultLabel.text!.insert("-", at: resultLabel.text!.startIndex)
                }else{
                    resultLabel.text!.remove(at: resultLabel.text!.startIndex)
                }
            }
        default:
            if(resultLabel.text! == "0") {
                 resultLabel.text! = sender.titleLabel!.text!
             }
             else {
                 resultLabel.text! += sender.titleLabel!.text!
             }
        }
        
      /*  if(resultLabel.text!.contains(".")) {
            print(Double(resultLabel.text!)!)
        }
        else {
            print(Int(resultLabel.text!)!)
        }////9090.897
        */
    }
    

    @IBAction func onArithmethicButton_Pressed(_ sender: UIButton) {
        //print(sender.titleLabel!.text!);
        activeOperator1=sender.titleLabel!.text!
        
        switch sender.titleLabel!.text! {
       
        case "+":
            resultLabel.text! = "+"
        
        default:
            resultLabel.text! += sender.titleLabel!.text!
        }
        
        
        
    }
    
}
