//
//  ViewController.swift
//  Tips Calculator
//
//  Created by RANGA REDDY NUKALA on 22/03/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
         
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        calculatorBrain.calculateTipValue(pctValue: buttonTitle)
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.f" ,sender.value)
        calculatorBrain.calculateNoOfPeople(people: sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        
        let bill  = billTextField.text!
        calculatorBrain.calculateResult(billValue: bill)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = calculatorBrain.getResult()
            destinationVC.tip = calculatorBrain.getTip()
            destinationVC.split = calculatorBrain.getNoOfPeople()
        }
    }
}

