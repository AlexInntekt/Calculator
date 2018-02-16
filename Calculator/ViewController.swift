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
        numberTwo = 0
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

    @IBAction func operationButtons(_ sender: UIButton)
    {
        
        if(!isItDoneComputing)
        {
            self.equal((Any).self)
        }
        
        
        
        //numberOne = number
        
        if(sender.tag==0)
        {
            currentOperation = .addition
            string += "\("+")"
        }
        if(sender.tag==1)
        {
            currentOperation = .substraction
            string += "\("-")"
        }
        if(sender.tag==2)
        {
            currentOperation = .multiplication
            string += "\("*")"
        }
        if(sender.tag==3)
        {
            currentOperation = .division
            string += "\("/")"
        }
        if(sender.tag==4)
        {
            currentOperation = .percentage
            string += "\("%")"
        }
        
        isItDoneComputing = false

        updateOutput()
    }
    
    
    
    
    @IBOutlet var equal: UIButtonX!
    @IBAction func equal(_ sender: Any)
    {
        
        isItDoneComputing = true
        number = compute(numberOne, numberTwo)
        numberOne = compute(numberOne, numberTwo)
        //numberTwo = 0
        
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
        
        numberTwo = 0
        isItDoneComputing = true
        updateOutput()
        print("\n-----------ENDING OPERATION--------------\n")
    }
    
    
    func updateOutput()
    {
        output.text = string
    }
    
    
    func compute(_ firstNumber: Double, _ secondNumber: Double) -> Double
    {
        var result: Double = 0.0
        
        print("Operation: ", currentOperation)
        print("numberOne: ", numberOne)
        print("numberTwo: ", numberTwo)
        print("result: ", number)
        
        
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

    
    
 
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
        initializeCalculator()
        //updateOutput()
    }
    
    
}


