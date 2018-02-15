//
//  ViewController.swift
//  Calculator
//
//  Created by Manolescu Mihai Alexandru on 15/02/2018.
//  Copyright © 2018 Manolescu Mihai Alexandru. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    enum operation
    {
        case addition
        case multiplication
        case substraction
        case division
        case nothing
    }
    
    var number: Double = 0.0
    var string: String = ""
    
    var numberOne = 0.0
    var numberTwo = 0.0
    
    var currentOperation: operation = .nothing
    var isItDoneComputing = true
    
    @IBOutlet var output: UILabel!
    
    
    @IBAction func AC(_ sender: Any)
    {
        number = 0.0
        string = String(number)
        updateOutput()
    }
    
    @IBAction func plusMinus(_ sender: Any)
    {
        
    }
    
    @IBAction func percentage(_ sender: Any)
    {
    }
    
    
    @IBAction func multiply(_ sender: Any) {
    }
    
    
    @IBAction func minus(_ sender: Any)
    {
        currentOperation = .substraction
        isItDoneComputing = false
    }
    
    
    @IBAction func plus(_ sender: Any)
    {
        currentOperation = .addition
        isItDoneComputing = false
    }
    
    
    @IBAction func divide(_ sender: Any)
    {
        currentOperation = .division
        isItDoneComputing = false
    }
    
    
    @IBAction func equal(_ sender: Any)
    {
        isItDoneComputing = true
        number = compute(numberOne, numberTwo)
        updateOutput()
    }
    
    
    @IBAction func point(_ sender: Any) {
    }
    
    
    
    
    @IBAction func seven(_ sender: Any)
    {
      
    }
    
    
    @IBAction func eight(_ sender: Any) {
    }
    
    @IBAction func nine(_ sender: Any) {
    }
    
    
    @IBAction func four(_ sender: Any) {
    }
    
    
    @IBAction func five(_ sender: Any) {
    }
    
    
    @IBAction func six(_ sender: Any) {
    }
    
    @IBAction func one(_ sender: Any)
    {
        number = 1
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 1
        }
        else
        {
            numberTwo = 1
        }
    }
    
    
    @IBAction func two(_ sender: Any) {
    }
    
    @IBAction func three(_ sender: Any) {
    }
    
    @IBAction func zero(_ sender: Any) {
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateOutput()
    {
        output.text = String(number)
    }

    func compute(_ firstNumber: Double, _ secondNumber: Double) -> Double
    {
        var result: Double = 0.0
        
        switch currentOperation
        {
          case .addition:
            result = Double(firstNumber + secondNumber)
        default:
            print("ERROR in compute(_ Double, _ DOuble)")
        }
        
        isItDoneComputing = true
        
        return result
    }

}

