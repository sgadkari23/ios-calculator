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
    var arithmeticOperation=""
    
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
        if !isFirstNumber{
            previousNumber = Double(sender.titleLabel!.text!)!
            resultLabel.text! = String(previousNumber)
            isFirstNumber=true
        }else{
            resultLabel.text! += sender.titleLabel!.text!
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
     /*
        switch sender.titleLabel!.text! {
        case "=":
           // resultLabel.text! += sender.titleLabel!.text!
            
        default:
            resultLabel.text! += sender.titleLabel!.text!
        }
   */
     }

    
}
