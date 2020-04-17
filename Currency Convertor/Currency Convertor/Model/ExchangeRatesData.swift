//
//  ExchangeRatesData.swift
//  Currency Convertor
//
//  Created by RANGA REDDY NUKALA on 17/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

// MARK: - ExchangeRatesData
struct ExchangeRatesData: Codable {
    let rates: [String:Float]
    let date: String
}


