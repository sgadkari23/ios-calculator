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
    var calculationFlag:Bool = false
    var equalsto = false
    
    var currentArithmeticOperation = ""
    
    var takeOperand:Bool=true
    var isTypingNumberFinished:Bool=false
    
    
    //var isEqual
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text! = "0"
    }
    
    @IBAction func onNumberButton_Pressed(_ sender: UIButton) {
        
        if !isTypingNumberFinished{
            resultLabel.text! = sender.titleLabel!.text!
            //onScreenNumber = Double(resultLabel.text!)!
            isTypingNumberFinished = true
        }else{
            resultLabel.text! += sender.titleLabel!.text!
            
        }
        onScreenNumber = Double(resultLabel.text!)!
        print("operand 2:\(onScreenNumber)")
    }
    
    
    @IBAction func clearResult(_ sender: UIButton) {
        
        resultLabel.text! = "0"
        calculationFlag = false
        isTypingNumberFinished = false
       // takeOperand = true
        leftOperand = 0.0
        rightOperand = 0.0
        finalSummation = 0.0
        currentArithmeticOperation = ""

    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func percentageButton_Pressed(_ sender: UIButton) {
        finalSummation = Double(resultLabel.text!)! * 0.01
        leftOperand = finalSummation
        resultLabel.text! = String(leftOperand)
        calculationFlag = true
        isTypingNumberFinished = false
        takeOperand = true
        currentArithmeticOperation = sender.titleLabel!.text!
    }
    
    
    @IBAction func onArithmethicButton_Pressed(_ sender: UIButton) {
        
        if calculationFlag {
            
            switch sender.titleLabel!.text! {
            case "+","-","x","÷":
                if !equalsto {
                    rightOperand = onScreenNumber
                    finalSummation = calculate(firstNum:leftOperand, secondNum:rightOperand)
                    leftOperand = finalSummation
                    currentArithmeticOperation = sender.titleLabel!.text!
                    resultLabel.text! = String(leftOperand)
                   // takeOperand = true
                    
                }else{
                    leftOperand = Double(resultLabel.text!)!
                    currentArithmeticOperation = sender.titleLabel!.text!
                }
            case "=":
                finalSummation = calculate(firstNum:leftOperand, secondNum:rightOperand)
                resultLabel.text! = String(finalSummation)
                calculationFlag = false
                takeOperand = true
                equalsto = true
            
            default:
                resultLabel.text! = "0"
            }
            
        }
        else{
            leftOperand = Double(resultLabel.text!)!
            currentArithmeticOperation = sender.titleLabel!.text!
            calculationFlag = true
            //takeOperand = true
        }
        
        isTypingNumberFinished = false
        
     }

    
    func calculate(firstNum:Double,secondNum:Double) -> Double{
        var total:Double = 0.0
        switch currentArithmeticOperation{
        case "+":
            total = firstNum + secondNum
        case "-":
            total = firstNum - secondNum
        case "x":
            total = firstNum * secondNum
        case "÷":
            total = firstNum / secondNum
        default:
            break
        }
        return total
    }

    
}
