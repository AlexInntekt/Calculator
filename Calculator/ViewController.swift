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
        case percentage
        case signChange
        case nothing
    }
    
    var number: Double = 0.0
    var string: String = ""
    
    var numberOne = 0.0
    var numberTwo = 0.0
    
    var currentOperation: operation = .addition
    var isItDoneComputing = true
    
    @IBOutlet var output: UILabel!
    
    
     @IBAction func keys(_ sender: UIButton)
    {
        if( string == "0")
        {
            string = String(sender.tag)
        }
        else
        {
            string += String(sender.tag)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(sender.tag) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(sender.tag) )!
            print("numberTwo: ", numberTwo)
        }
        updateOutput()
    }
    
    
   
    
    
    @IBAction func point(_ sender: Any)
    {
        string += "."
        updateOutput()
    }
    
    
    @IBAction func AC(_ sender: Any)
    {
        numberOne = 0
        isItDoneComputing = true
        number = 0.0
        string = String( Int(number) )
        updateOutput()
    }
    


    @IBAction func changeSign(_ sender: Any)
    {
        currentOperation = .signChange
        isItDoneComputing = false
        
        self.equal((Any).self)
        updateOutput()
    }
    
    @IBAction func percentage(_ sender: Any)
    {
        if(isItDoneComputing)
        {
            self.equal((Any).self)
        }
        
        currentOperation = .percentage
        isItDoneComputing = false
        
        string += "\("%")"
        updateOutput()
    }
    
    
    @IBAction func plus(_ sender: Any)
    {

        if !isItDoneComputing
        {
            self.equal((Any).self)
        }

        numberOne = number
        
        currentOperation = .addition
        
        isItDoneComputing = false
        
        
        string += "\("+")"
        updateOutput()
    }
    
    @IBAction func minus(_ sender: Any)
    {
        
        if !isItDoneComputing
        {
            self.equal((Any).self)
        }

        numberOne = number
        
        currentOperation = .substraction
        
        isItDoneComputing = false
        
        
        string += "\("-")"
        updateOutput()
    }
    
    
    @IBAction func multiply(_ sender: Any)
    {

        self.equal((Any).self)
        numberOne = number
        
        currentOperation = .multiplication
        
        isItDoneComputing = false
        
        string += "\("*")"
        updateOutput()
    }
 
    
    @IBAction func divide(_ sender: Any)
    {

        self.equal((Any).self)
        numberOne = number

        currentOperation = .division
        
        isItDoneComputing = false
        
        
        string += "\("/")"
        updateOutput()
    }
    
    
    @IBOutlet var equal: UIButtonX!
    @IBAction func equal(_ sender: Any)
    {
        
        isItDoneComputing = true
        number = compute(numberOne, numberTwo)
        numberOne = compute(numberOne, numberTwo)
        numberTwo = 0
        print("numberOne: ", numberOne)
        print("numberTwo: ", numberTwo)
        
        //checking if the number is natural or not:
        if ( number == number.rounded() )
        {   //if it is then we display the number as an integer (no digits after 0):
            string = String( Int(number) )
        }
        else
        {
            //otherwise we display it with digits after 0:
            string = String( number )
        }
        
        isItDoneComputing = true
        updateOutput()
    }
    
    

    
    
    
 
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
        initializeCalculator()
        //updateOutput()
    }
    
    func updateOutput()
    {
        output.text = string
    }

    func compute(_ firstNumber: Double, _ secondNumber: Double) -> Double
    {
        var result: Double = 0.0
        
        switch currentOperation
        {
          case .addition:
            result = Double(firstNumber + secondNumber)
          case .substraction:
            result = Double(firstNumber - secondNumber)
          case .multiplication:
            result = Double(firstNumber * secondNumber)
          case .division:
            result = Double(firstNumber / secondNumber)
        case .percentage:
            result = Double(firstNumber * secondNumber / 100)
        case .signChange:
            result = Double(-firstNumber)
            
        default:
            print("ERROR in compute(_ Double, _ DOuble)")
        }
        
        isItDoneComputing = true
        
        return result
    }
    
    func initializeCalculator()
    {
        number = 0
        string = String( Int(number) )
        self.AC((Any).self)
        updateOutput()
    }

}


