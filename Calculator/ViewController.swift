//
//  ViewController.swift
//  Calculator
//
//  Created by Burak Yılmaz on 13.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Result: UILabel!
    var firstNumber:Float = 0
    var secondNumber:Float = 0
    var firstNumberForMultiplyAndDivide:Float = 1
    var result:Float = 0
    var countEqual = 0
    var currentOperator: Operations = .add
    var divideCounter = 0
    
    
    enum Operations{
        case add
        case substract
        case multiply
        case divide
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Result.text = ""
        
    }
    
    @IBAction func Number(_ sender: UIButton) {
        let result = Result.text
        let new = sender.titleLabel?.text
        Result.text = "\(result!)\(new!)"
    }
    
    
    @IBAction func Operator(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "x":
            firstNumberForMultiplyAndDivide *= Float(Result.text!) ?? 1
            currentOperator = .multiply
            Result.text = ""

        case "/":
            if divideCounter != 0 {
                firstNumberForMultiplyAndDivide /= Float(Result.text!) ?? 1
            }else{
                firstNumberForMultiplyAndDivide = Float(Result.text!) ?? 1
                divideCounter+=1
            }
            
            currentOperator = .divide
            Result.text = ""
            
        case "-":
            if firstNumber != 0{
                firstNumber -= Float(Result.text!) ?? 0
            }
            firstNumber = Float(Result.text!) ?? 0
            currentOperator = .substract
            Result.text = ""
            
        case "+":
            firstNumber += Float(Result.text!) ?? 0
            currentOperator = .add
            Result.text = ""
            
        case "AC":
            result = 0
            firstNumber = 0
            secondNumber = 0
            firstNumberForMultiplyAndDivide = 1
            Result.text = ""
            
        case "+/-":
            Result.text = "-\(Result.text!)"
    
        case "%":
            firstNumber = Float(Result.text!) ?? 0
            let divededByHundred = firstNumber/100
            
            if divededByHundred.rounded(.up) == divededByHundred.rounded(.down) {
                Result.text = String(Int(divededByHundred))
            }else{
                Result.text = String(format: "%.2f", divededByHundred)
            }
        
        
        default:
            print("default")
        }
    }
    
    
    @IBAction func equal(_ sender: UIButton) {
        secondNumber = Float(Result.text!) ?? 0
        switch currentOperator {
        case .add:
            result = firstNumber + secondNumber
            if result.rounded(.up) == result.rounded(.down) {
                Result.text = String(Int(result))
            }else{
                Result.text = String(format: "%.1f", result)
            }
            
        case .substract:
            result = firstNumber - secondNumber
            if result.rounded(.up) == result.rounded(.down) {
                Result.text = String(Int(result))
            }else{
                Result.text = String(format: "%.1f", result)
            }
        case .multiply:
            result = firstNumberForMultiplyAndDivide * secondNumber
            if result.rounded(.up) == result.rounded(.down) {
                Result.text = String(Int(result))
            }else{
                Result.text = String(format: "%.1f", result)
            }
        case .divide:
            result = firstNumberForMultiplyAndDivide / secondNumber
            if result.rounded(.up) == result.rounded(.down) {
                Result.text = String(Int(result))
            }else{
                Result.text = String(format: "%.1f", result)
            }
        }
        
        result = 0
        firstNumber = 0
        secondNumber = 0
        firstNumberForMultiplyAndDivide = 1
        divideCounter = 0
        
    }
    
}

