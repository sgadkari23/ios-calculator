//
//  ViewController.swift
//  Calculator
//  App Name: Arithmetic Calculator
//  Created by Supriya Gadkari on 09/27/20.
//  Student ID: 301140872
//  App Description: A Simple arithmetic calculator built using storyboard UI and swift
//  App version: 0.2
//  XCode version: 12.0.1

import UIKit

class ViewController: UIViewController {
  
    // Storing left and right operands
    var leftOperand:Double = 0.0
    var rightOperand:Double = 0.0
    // Displayed current subtotal
    var onScreenNumber:Double = 0.0
    // Final calculation on press of equals
    var finalSummation:Double=0.0
    // Check if user is entering second (or more) operand
    var calculationFlag:Bool = false
    // Equal to pressed to calculate final result
    var equalsto = false
    // Track of last operator
    var currentArithmeticOperation = ""
    // Check if user is typing operand
    var isTypingNumberFinished:Bool=false
    // If input contains decimal point
    var decimal:Bool = false
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text! = "0"
    }
    
    // 0-9 number button pressed, display number on screen
    @IBAction func onNumberButton_Pressed(_ sender: UIButton) {
        if !isTypingNumberFinished{
            resultLabel.text! = sender.titleLabel!.text!
            isTypingNumberFinished = true
        }else{
            resultLabel.text! += sender.titleLabel!.text!
        }
        onScreenNumber = Double(resultLabel.text!)!
    }
    
    // Clear result button, reset all
    @IBAction func clearResult(_ sender: UIButton) {
        resultLabel.text! = "0"
        calculationFlag = false
        isTypingNumberFinished = false
        equalsto = false
        leftOperand = 0.0
        rightOperand = 0.0
        finalSummation = 0.0
        onScreenNumber = 0.0
        currentArithmeticOperation = ""
        decimal = false
    }
    
    // Delete button, remove last character from the displayed on screen value
    @IBAction func deleteButton(_ sender: UIButton) {
        if (resultLabel.text!.count <= 1) || (resultLabel.text! == "-"){
            resultLabel.text! = "0"
        }
        else{
            resultLabel.text!.remove(at: resultLabel.text!.index(before: resultLabel.text!.endIndex))
            onScreenNumber = Double(resultLabel.text!)!
        }
    }
    
    // Plus minus button, change positive to negative and vice versa of displayed value
    @IBAction func plusMinusButton(_ sender: UIButton) {
        leftOperand = Double(resultLabel.text!)! * -1
        
        if floor(leftOperand) == leftOperand {
            resultLabel.text! = String(Int(leftOperand))
        }
        else {
            resultLabel.text! = String(leftOperand)
        }
    }
    
  /*  @IBAction func sinButton(_ sender: UIButton) {
        finalSummation = sin(Double(resultLabel.text!)!)
        leftOperand = finalSummation
        resultLabel.text! = String(finalSummation)
        calculationFlag = true
        isTypingNumberFinished = false
        currentArithmeticOperation = sender.titleLabel!.text!
    }
    
    @IBAction func cosButton(_ sender: UIButton) {
        
        finalSummation = cos(Double(resultLabel.text!)!)
        leftOperand = finalSummation
        resultLabel.text! = String(finalSummation)
        calculationFlag = true
        isTypingNumberFinished = false
        currentArithmeticOperation = sender.titleLabel!.text!
    }
     
     // Percentage button, display percent of on screen value
     @IBAction func percentageButton_Pressed(_ sender: UIButton) {
         finalSummation = Double(resultLabel.text!)! * 0.01
         leftOperand = finalSummation
         resultLabel.text! = String(format:"%.8f",leftOperand)
         calculationFlag = true
         isTypingNumberFinished = false
         currentArithmeticOperation = sender.titleLabel!.text!
     }
    */
    
    @IBAction func additionalFunationButton(_ sender: UIButton) {
        
        switch sender.titleLabel!.text! {
        case "%":
            finalSummation = Double(resultLabel.text!)! * 0.01
        case "Sin":
            finalSummation = sin(Double(resultLabel.text!)!)
        case "Cos":
            finalSummation = cos(Double(resultLabel.text!)!)
        case "Tan":
            finalSummation = tan(Double(resultLabel.text!)!)
        case "√x":
            finalSummation = sqrt(Double(resultLabel.text!)!)
        default :
            resultLabel.text! = "0"
        }
        leftOperand = finalSummation
        resultLabel.text! = String(format:"%.8f",leftOperand)
        calculationFlag = true
        isTypingNumberFinished = false
        currentArithmeticOperation = sender.titleLabel!.text!
        
    }
    
    // Decimal pressed
    @IBAction func addDecimal(_ sender: UIButton) {
        if(!decimal && !resultLabel.text!.contains(".")){
            resultLabel.text! = resultLabel.text!+"."
            onScreenNumber = Double(resultLabel.text!)!
            decimal = true
        }
    }
    
    
    // Operator button pressed
    @IBAction func onArithmethicButton_Pressed(_ sender: UIButton) {
        
        if calculationFlag {
            
            switch sender.titleLabel!.text! {
            case "+","-","x","÷":
                if !equalsto {
                    rightOperand = onScreenNumber
                    finalSummation = calculate(firstNum:leftOperand, secondNum:rightOperand)
                    leftOperand = finalSummation
                    currentArithmeticOperation = sender.titleLabel!.text!
                    if floor(leftOperand) == leftOperand {
                        // Is an integer
                        resultLabel.text! = String(Int(leftOperand))
                    }else {
                        // contains decimal point
                        resultLabel.text! = String(format:"%.8f",leftOperand)
                    }
                } else {
                    leftOperand = Double(resultLabel.text!)!
                    currentArithmeticOperation = sender.titleLabel!.text!
                }
            
            case "=":
                rightOperand = onScreenNumber
                finalSummation = calculate(firstNum:leftOperand, secondNum:rightOperand)
                if floor(finalSummation) == finalSummation {
                    // Is an integer
                    resultLabel.text! = String(Int(finalSummation))
                } else{
                    // Contains decimal points
                    resultLabel.text! = String(format:"%.8f",finalSummation)
                }
                calculationFlag = false
                isTypingNumberFinished = false
                equalsto = true
                decimal = false
            
            default:
                resultLabel.text! = "0"
            }
        }
        else{
            leftOperand = Double(resultLabel.text!)!
            currentArithmeticOperation = sender.titleLabel!.text!
            calculationFlag = true
            decimal = false
        }
        isTypingNumberFinished = false
        decimal = false
     }

    // Calculation function
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
