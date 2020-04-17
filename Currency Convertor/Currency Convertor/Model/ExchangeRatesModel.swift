//
//  ExchangeRatesModel.swift
//  Currency Convertor
//
//  Created by RANGA REDDY NUKALA on 17/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

struct ExchangeRatesModel {
    
    var baseCurrencyValue: Float
    var targetCurrencyValue: Float
    var date: String
    
    var result: Float  {
        
        return targetCurrencyValue/baseCurrencyValue
       
    }

    
}
