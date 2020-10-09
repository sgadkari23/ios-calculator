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
  
    var previousNumber:Double = 0.0
    var onScreenNumber:Double = 0.0
    var displayNumber:Double = 0.0
    var isFirstNumber:Bool=false
    var finalResult:Double=0.0
    var setOperator=""
    var isTypingNumberFinished:Bool=false
    
    //if (!isFirstNum) {
        
    //}
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text! = "0"
    }
    
    @IBAction func onNumberButton_Pressed(_ sender: UIButton) {
        
       // print(sender.titleLabel!.text!);
        
        /*if (isFirstNum==false) {
            resultLabel.text = "0"
        }*/
        if !isTypingNumberFinished{
            if !isFirstNumber{
                previousNumber = Double(sender.titleLabel!.text!)!
                resultLabel.text! = sender.titleLabel!.text!
                isFirstNumber=true
            }else{
                resultLabel.text! += sender.titleLabel!.text!
                previousNumber = Double(resultLabel.text!)!
             }
        }
        else{
            if (String(displayNumber)=="0.0") {
                resultLabel.text! = sender.titleLabel!.text!
                displayNumber = Double(resultLabel.text!)!
            }
            else{
                resultLabel.text! += sender.titleLabel!.text!
                displayNumber = Double(resultLabel.text!)!
            }
        }
      
    }
    

    @IBAction func onArithmethicButton_Pressed(_ sender: UIButton) {
        
      
        
        //print(sender.titleLabel!.text!);
        //resultLabel.text! += sender.titleLabel!.text!
        
       
        /*
        if (sender.titleLabel!.text! == "+") {
            var oper1 = resultLabel.text!
            //print(sender.titleLabel!.text!)
        }
        */
    
    
        switch sender.titleLabel!.text! {
        case "+":
            setOperator = "add"
            isTypingNumberFinished=true
            isFirstNumber=true
            return
        default:
            resultLabel.text! += sender.titleLabel!.text!
        }
        
        
        switch setOperator {
        case "add":
            finalResult = previousNumber + displayNumber
            return
        case "=":
            resultLabel.text! = String(finalResult)
            return
        default:
            resultLabel.text! += sender.titleLabel!.text!
        }
   
     }

    
}
