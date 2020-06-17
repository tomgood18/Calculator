//
//  ViewController.swift
//  myCalculator
//
//  Created by Thomas Good on 30/3/20.
//  Copyright © 2020 Thomas Good. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    var numberOne: Double!
    var intNumber: Int!
    var operate: String! = ""
    var reset: Bool! = false
    var isDouble: Bool! = false
    
    enum MathError: Error {
        case divideByZero
    }
    
    @IBAction func clear(_ sender: UIButton) {
        resultLabel.text = ("0")
        //numberOne = 0
        //intNumber = 0
        operate = ""
        reset = false
        isDouble = false
    }
    @IBAction func setZero(_ sender: UIButton) {
        setNum(number: "0")
    }
    @IBAction func setOne(_ sender: UIButton) {
        setNum(number: "1")
    }
    @IBAction func setTwo(_ sender: UIButton) {
        setNum(number: "2")
    }
    @IBAction func setThree(_ sender: UIButton) {
        setNum(number: "3")
    }
    @IBAction func setFour(_ sender: UIButton) {
        setNum(number: "4")
    }
    @IBAction func setFive(_ sender: UIButton) {
        setNum(number: "5")
    }
    @IBAction func setSix(_ sender: UIButton) {
        setNum(number: "6")
    }
    @IBAction func setSeven(_ sender: UIButton) {
        setNum(number: "7")
    }
    @IBAction func setEight(_ sender: UIButton) {
        setNum(number: "8")
    }
    @IBAction func setNine(_ sender: UIButton) {
        setNum(number: "9")
    }
    
    func setNum(number: String){
        if (resultLabel.text != "0" && reset != true) {
            if ((resultLabel.text?.contains("."))!) {
                resultLabel.text = (resultLabel.text! + number)
            } else {
                let firstNo: Int = Int(resultLabel.text!)!
                
                resultLabel.text = (String((firstNo * 10) + Int(number)!))
            }
        }
        else {
            resultLabel.text = (number)
            reset = false
        }
    }
    
    @IBAction func setPercentage(_ sender: UIButton) {
        let percentage: Double = Double(resultLabel.text!)!;
        resultLabel.text = String(percentage * 0.01);
    }
    
    @IBAction func setNegative(_ sender: UIButton) {
        if (!(resultLabel.text?.contains("-"))!){
            resultLabel.text = ("-" + resultLabel.text!)
        }
        else if ((resultLabel.text?.contains("-"))!) {
            if ((resultLabel.text?.contains("."))!){
                let number = Double(resultLabel.text!);
                resultLabel.text = String(abs(number!))
            }
            else {
                let number = Int(resultLabel.text!);
                resultLabel.text = String(abs(number!))
            }
            
            
        }
    }
    
    @IBAction func setDecimal(_ sender: UIButton) {
        if (!resultLabel.text!.contains(".")) {
            if (resultLabel.text != "0" && reset != true) {
                resultLabel.text = (resultLabel.text! + ".")
            }
            else {
                resultLabel.text = ("0.")
                reset = false
            }
        }
    }
    
    @IBAction func divide(_ sender: UIButton) {
        getOperation(operation: "/")
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        getOperation(operation: "*")
    }
    
    @IBAction func minus(_ sender: UIButton) {
        getOperation(operation: "-")
    }
    
    @IBAction func plus(_ sender: UIButton) {
        getOperation(operation: "+")
    }
    
    func getOperation(operation: String){
        
        if (operate != "") {
            doOperation()
        }
        
        if ((resultLabel.text!.contains("."))) {
            numberOne = Double(resultLabel.text!)
            isDouble = true
        }
        else {
            intNumber = Int(resultLabel.text!)
            isDouble = false
        }
        operate = operation
        reset = true
    }
    
    func checkDivideByZero() throws {
        if (numberOne == 0 || Int(resultLabel.text!) == 0){
            throw MathError.divideByZero
        }
    }
    
    
    
    @IBAction func equals(_ sender: UIButton) {
        doOperation()
    }
    
    func doOperation() {
        if (operate == "/"){
            do {
                try checkDivideByZero()
                if (isDouble == true){
                    resultLabel.text = String((numberOne / Double(resultLabel.text!)!))
                }
                else if (resultLabel.text!.contains(".")) {
                    resultLabel.text = String((Double(intNumber!)) / Double(resultLabel.text!)!)
                }
                else {
                    resultLabel.text = String((intNumber) / Int(resultLabel.text!)!)
                }
            } catch {
                resultLabel.text = "Error"
            }
        }
        else if (operate == "*"){
            if (isDouble == true){
                resultLabel.text = String((numberOne * Double(resultLabel.text!)!))
            }
            else if (resultLabel.text!.contains(".")) {
                resultLabel.text = String((Double(intNumber!)) * Double(resultLabel.text!)!)
            }
            else {
                if (resultLabel.text == "Error"){
                    resultLabel.text = "0"
                }
                else {
                    resultLabel.text = String((intNumber) * Int((resultLabel.text)!)!)

                }
            }
        }
        else if (operate == "-"){
            if (isDouble == true){
                resultLabel.text = String((numberOne - Double(resultLabel.text!)!))
            }
            else if (resultLabel.text!.contains(".")) {
                resultLabel.text = String((Double(intNumber!)) - Double(resultLabel.text!)!)
            }
            else {
                if (resultLabel.text == "Error"){
                    resultLabel.text = "0"
                }
                else {
                    resultLabel.text = String((intNumber) - Int(resultLabel.text!)!)
                }
            }
        }
        else if (operate == "+"){
            
            if (isDouble == true){
                resultLabel.text = String((numberOne + Double(resultLabel.text!)!))
            }
            else if (resultLabel.text!.contains(".")) {
                resultLabel.text = String((Double(intNumber!)) + Double(resultLabel.text!)!)
            }
            else {
                if (resultLabel.text == "Error"){
                    resultLabel.text = "0"
                }
                else {
                    resultLabel.text = String((intNumber) + Int(resultLabel.text!)!)
                }
            }
        }
        operate = ""
        reset = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

