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
  
    var leftOperand:Double = 0.0
    var rightOperand:Double=0.0
    var onScreenNumber:Double = 0.0
    var finalResult:Double=0.0
    
    var currentArithmeticOperation=""
    
    var takeOperand:Bool=true
    var isTypingNumberFinished:Bool=false
    var  calculationFlag:Bool = false
    var isEqual
    
    
    
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
        if takeOperand{
            resultLabel.text! = sender.titleLabel!.text!
            onScreenNumber = Double(resultLabel.text!)!
            takeOperand=false
        }else{
            resultLabel.text! += sender.titleLabel!.text!
            onScreenNumber = Double(resultLabel.text!)!
        }
        print("operand 2:\(onScreenNumber)")
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
    
        
        if currentArithmeticOperation != "="{
             print("Summation")
        }
        else{
            currentArithmeticOperation = sender.titleLabel!.text!
            calculationFlag = true
            takeOperand = true
            leftOperand = Double(resultLabel.text!)!
            print("operand 1:\(leftOperand)")
        }
        
        isTypingNumberFinished = true
        
     }

    
    func calculate(firstOperand:Double,secondOperand:Double) -> Double{
        var total:Double = 0.0
        switch currentArithmeticOperation{
        case "+":
            total = firstOperand + secondOperand
        case "-":
            total = firstOperand - secondOperand
        case "*":
            total = firstOperand * secondOperand
        case "÷":
            total = firstOperand / secondOperand
        default:
            break
        }
        return sum
    }

    
}
