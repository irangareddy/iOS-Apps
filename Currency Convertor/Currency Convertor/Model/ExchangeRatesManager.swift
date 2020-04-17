//
//  ExchangeRatesManager.swift
//  Currency Convertor
//
//  Created by RANGA REDDY NUKALA on 17/04/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

protocol ExRatesManagerDelegate {
    func didUpdateExchangeRates(_ exManageer: ExchangeRatesManager, exchangeRates: ExchangeRatesModel)
    func didFailWithError(error: Error)
}

class ExchangeRatesManager {
    
    var baseCurrency: String = ""
    var targetCurrency: String = ""
    var delegate: ExRatesManagerDelegate?
    
    let countries = ["India Rupee":"INR",
                     "United States Dollar":"USD",
                     "Australian Dollar":"AUD",
                     "Canadian Dollar":"CAD",
                     "Hong Kong Dollar":"HKD",
                     "Icelandic Krona":"ISK",
                     "Philippine Peso":"PHP",
                     "Danish Krone":"DKK",
                     "Hungarian Forint":"HUF",
                     "Czech Koruna":"CZK",
                     "Romanian Leu":"RON",
                     "Swedish Krona":"SEK",
                     "Indonesian Rupiah":"IDR",
                     "Brazilian Real":"BRL",
                     "Russian Ruble":"RUB",
                     "Croatian Kuna":"HRK",
                     "Japanese Yen":"JPY",
                     "Thai Baht":"THB",
                     "Swiss Franc":"CHF",
                     "Singapore Dollar":"SGD",
                     "Polish Zloty":"PLN",
                     "Bulgarian Lev":"BGN",
                     "Turkish Lira":"TRY",
                     "Chinese Renminbi":"CNY",
                     "Norwegian Krone":"NOK",
                     "New Zealand Dollar":"NZD",
                     "South African Rand":"ZAR",
                     "Mexican Peso":"MXN",
                     "Israeli New Shekel":"ILS",
                     "UK Pound":"GBP",
                     "South Korean Won":"KRW",
                     "Malaysian Ringgit":"MYR"]
    
    let baseURL = "https://api.exchangeratesapi.io/latest?symbols="
    
    
    func getExchangeRates(with baseCurrency: String,with targetCurrency: String) {
        
        self.baseCurrency = baseCurrency
        self.targetCurrency = targetCurrency
        
        let urlString = "\(baseURL)\(baseCurrency),\(targetCurrency)"
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                if data != nil {
                    
                    if let ratesData = self.parseJSON(exchangeData: data!){
                        
                        self.delegate?.didUpdateExchangeRates(self, exchangeRates: ratesData)
                    }
                    
                    
                    
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(exchangeData: Data) -> ExchangeRatesModel? {
        
        let decoder = JSONDecoder()
        do {
            var exchageRates: ExchangeRatesModel? = nil
            let decodedData = try decoder.decode(ExchangeRatesData.self, from: exchangeData)
            let date = decodedData.date
            let Currency = decodedData.rates
            let baseCurrencyValue = Currency[baseCurrency]
            let targetCurrencyValue = Currency[targetCurrency]
            
            if baseCurrencyValue != nil,targetCurrencyValue != nil {
                exchageRates = ExchangeRatesModel(baseCurrencyValue: baseCurrencyValue!, targetCurrencyValue: targetCurrencyValue!, date: date)
            }
            return exchageRates
        }
        catch {
            print(error)
            return nil
        }
    }
}
