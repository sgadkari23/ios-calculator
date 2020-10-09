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
    var finalSummation:Double=0.0
    
    var currentArithmeticOperation=""
    
    var takeOperand:Bool=true
    var isTypingNumberFinished:Bool=false
    var  calculationFlag:Bool = false
    //var isEqual
    
    
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
        
        if calculationFlag {
            
            switch currentArithmeticOperation {
            case "+","-","*","÷" :
                rightOperand = Double(onScreenNumber)
                finalSummation = calculate(firstNum:leftOperand, secondNum:rightOperand)
                leftOperand = finalSummation
                resultLabel.text! = String(leftOperand)
                currentArithmeticOperation = sender.titleLabel!.text!
                
            case "=":
                finalSummation = calculate(firstNum:leftOperand, secondNum:rightOperand)
                resultLabel.text! = String(finalSummation)
                calculationFlag = false
                takeOperand = true
            
            case "C":
                resultLabel.text! = "0"
                calculationFlag = false
                takeOperand = true
                
            /*case "⌫" :
                if (resultLabel.text!.count <= 1) || (resultLabel.text! == "-")
                {
                    resultLabel.text! = "0"
                    
                }else{
                    resultLabel.text!.popLast()
                }
                */
            default:
                resultLabel.text! = "0"
            }
            
        }
        else{
            leftOperand = Double(resultLabel.text!)!
            currentArithmeticOperation = sender.titleLabel!.text!
            calculationFlag = true
            takeOperand = true
            
        }
        
        isTypingNumberFinished = true
        
     }

    
    func calculate(firstNum:Double,secondNum:Double) -> Double{
        var total:Double = 0.0
        switch currentArithmeticOperation{
        case "+":
            total = firstNum + secondNum
        case "-":
            total = firstNum - secondNum
        case "*":
            total = firstNum * secondNum
        case "÷":
            total = firstNum / secondNum
        default:
            break
        }
        return total
    }

    
}
