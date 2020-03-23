//
//  Calculator Brain.swift
//  Tips Calculator
//
//  Created by RANGA REDDY NUKALA on 23/03/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var tip = Tip(finalResult: "0.0", tipValue: 0.10, billTotal: 0.0,noOfPeople: 2)
    
    func getResult() -> String {
        return tip.finalResult
    }
    
    func getTip() -> Int{
        return Int(tip.tipValue * 100)
    }
    
    func getNoOfPeople() -> Int {
        return tip.noOfPeople
    }
    
    mutating func calculateTipValue(pctValue: String) {
        let buttonPctDrop = String(pctValue.dropLast())
        let buttonTitleAsNumber = Double(buttonPctDrop)!
        tip.tipValue = buttonTitleAsNumber/100
    }
    
    mutating func calculateNoOfPeople(people: Double) {
        tip.noOfPeople = Int(people)
    }
    
    mutating func calculateResult(billValue: String) {
        if billValue != "" {
            tip.billTotal = Double(billValue)!
            let result = (tip.billTotal) * (1 + tip.tipValue) / Double(tip.noOfPeople)
            tip.finalResult = String(format: "%.2f", result)
        }
        
        
        
    }
    
    
    
}
