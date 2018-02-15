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
    
    var currentOperation: operation = .nothing
    var isItDoneComputing = true
    
    @IBOutlet var output: UILabel!
    
    
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
        currentOperation = .percentage
        isItDoneComputing = false
        
        string += "\("%")"
        updateOutput()
    }
    
    
    @IBAction func multiply(_ sender: Any)
    {
        currentOperation = .multiplication
        isItDoneComputing = false
        
        string += "\("*")"
        updateOutput()
    }
    
    
    @IBAction func minus(_ sender: Any)
    {
        currentOperation = .substraction
        isItDoneComputing = false
        
        string += "\("-")"
        updateOutput()
    }
    
    
    @IBAction func plus(_ sender: Any)
    {
        currentOperation = .addition
        isItDoneComputing = false
        
        string += "\("+")"
        updateOutput()
    }
    
    
    @IBAction func divide(_ sender: Any)
    {
        currentOperation = .division
        isItDoneComputing = false
        
        string += "\("/")"
        updateOutput()
    }
    
    
    @IBAction func equal(_ sender: Any)
    {
        isItDoneComputing = true
        number = compute(numberOne, numberTwo)
        numberOne = compute(numberOne, numberTwo)
        numberTwo = 0
        //checking if the number is natural or not:
        if ( number == number.rounded() )
        {   //if it is then we display the number as an integer (no digits after 0):
            string = String( Int(number) )
            print("natural: ", Int(number))
        }
        else
        {
            //otherwise we display it with digits after 0:
            string = String( number )
        }
        
        updateOutput()
    }
    
    
    @IBAction func point(_ sender: Any)
    {
        
    }
    
    
    
    
    @IBAction func seven(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(7)
        }
        else
        {
            string += String(7)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(7) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(7) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
      
    }
    
    
    @IBAction func eight(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(8)
        }
        else
        {
            string += String(8)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(8) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(8) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
    }
    
    @IBAction func nine(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(9)
        }
        else
        {
            string += String(9)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(9) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(9) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
    }
    
    
    @IBAction func four(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(4)
        }
        else
        {
            string += String(4)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(4) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(4) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
    }
    
    
    @IBAction func five(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(5)
        }
        else
        {
            string += String(5)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(5) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(5) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
    }
    
    
    @IBAction func six(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(6)
        }
        else
        {
            string += String(6)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(6) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(6) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
    }
    
    @IBAction func one(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(1)
        }
        else
        {
            string += String(1)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(1) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(1) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        

    }
    
    
    @IBAction func two(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(2)
        }
        else
        {
            string += String(2)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(2) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(2) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
    }
    
    @IBAction func three(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(3)
        }
        else
        {
            string += String(3)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(3) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(3) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
    }
    
    @IBAction func zero(_ sender: Any)
    {
        if( string == "0")
        {
            string = String(0)
        }
        else
        {
            string += String(0)
        }
        
        if isItDoneComputing
        {
            numberOne = Double( String( Int(numberOne) ) + String(0) )!
            print("numberOne: ", numberOne)
        }
        else
        {
            numberTwo = Double( String( Int(numberTwo) ) + String(0) )!
            print("numberTwo: ", numberTwo)
        }
        
        updateOutput()
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        //initializeCalculator()
        updateOutput()
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
        updateOutput()
    }

}


