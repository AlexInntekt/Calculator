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
        string = String( Int(number) )
        updateOutput()
    }
    
    @IBAction func plusMinus(_ sender: Any)
    {
        
    }
    
    @IBAction func percentage(_ sender: Any)
    {
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
        string += String(7)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 7
        }
        else
        {
            numberTwo = 7
        }
      
    }
    
    
    @IBAction func eight(_ sender: Any)
    {
        string += String(8)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 8
        }
        else
        {
            numberTwo = 8
        }
    }
    
    @IBAction func nine(_ sender: Any)
    {
        string += String(9)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 9
        }
        else
        {
            numberTwo = 9
        }
    }
    
    
    @IBAction func four(_ sender: Any)
    {
        string += String(4)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 4
        }
        else
        {
            numberTwo = 4
        }
    }
    
    
    @IBAction func five(_ sender: Any)
    {
        string += String(5)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 5
        }
        else
        {
            numberTwo = 5
        }
    }
    
    
    @IBAction func six(_ sender: Any)
    {
        string += String(6)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 6
        }
        else
        {
            numberTwo = 6
        }
    }
    
    @IBAction func one(_ sender: Any)
    {
        string += String(1)
        updateOutput()
        if(number != 0)
        {
            if isItDoneComputing
            {
                numberOne = 1
            }
            else
            {
                numberTwo = 1
            }
        }
    }
    
    
    @IBAction func two(_ sender: Any)
    {
        string += String(2)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 2
        }
        else
        {
            numberTwo = 2
        }
    }
    
    @IBAction func three(_ sender: Any)
    {
        string += String(3)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 3
        }
        else
        {
            numberTwo = 3
        }
    }
    
    @IBAction func zero(_ sender: Any)
    {
        string += String(0)
        updateOutput()
        
        if isItDoneComputing
        {
            numberOne = 0
        }
        else
        {
            numberTwo = 0
        }
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


