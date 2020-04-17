//
//  ViewController.swift
//  Currency Convertor
//
//  Created by RANGA REDDY NUKALA on 30/03/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var baseCurrencyPicker: UIPickerView!
    @IBOutlet weak var target1CurrencyPicker: UIPickerView!
    @IBOutlet weak var target2CurrencyPicker: UIPickerView!
    
    
    @IBOutlet weak var baseCurrencyField: UITextField!
    @IBOutlet weak var target1CurrencyField: UITextField!
    @IBOutlet weak var target2CurrencyField: UITextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var exManager = ExchangeRatesManager()
    var country: [String?] = []
    var countryCode: String? = ""
    var baseCountry: String? = ""
    var targetCountry: String? = ""
    var exchangeRate: Float? = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        baseCurrencyPicker.dataSource = self
        target1CurrencyPicker.dataSource = self
        target2CurrencyPicker.dataSource = self
        
        baseCurrencyPicker.delegate = self
        target1CurrencyPicker.delegate = self
        target2CurrencyPicker.delegate = self
        
        baseCurrencyField.delegate = self
        target1CurrencyField.delegate = self
        target2CurrencyField.delegate = self
        
        exManager.delegate = self
        baseCurrencyField.becomeFirstResponder()
        
    }
    
    
}


extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exManager.countries.count
    }
}


extension ViewController: UIPickerViewDelegate {
    
    
    //
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        for key in ccManager.countries.keys {
    //            country.append(key)
    //        }
    //        return country[row]
    //    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryCode = exManager.countries[country[row]!]!
        
        switch pickerView.tag {
        case 1:
            baseCountry = countryCode
        case 2:
            targetCountry = countryCode
        case 3:
            targetCountry = countryCode
        default:
            print(pickerView.tag)
        }
        if baseCountry != "" && targetCountry != "" {
            exManager.getExchangeRates(with: baseCountry!, with: targetCountry!)
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        label.font = UIFont (name: "Helvetica Neue", size: 18)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //data source means your ui picker view items array
        
        
        for key in exManager.countries.keys {
            country.append(key)
        }
        
        label.text =  country[row]
        label.textAlignment = .center
        return label
    }
}

//MARK: - CCManagerDelegate

extension ViewController: ExRatesManagerDelegate {

    func didUpdateExchangeRates(_ exManageer: ExchangeRatesManager, exchangeRates: ExchangeRatesModel) {
        DispatchQueue.main.async {
            self.exchangeRate = exchangeRates.result
            self.dateLabel.text = "Exchange rates are updated by Exchangesratesapi.io (\(exchangeRates.date))"
        }
    }

    func didFailWithError(error: Error) {
        print(error)
    }


}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let data = textField.text!
        let floatdata = Float(data)
        
        if exchangeRate != nil,floatdata != nil {
            target1CurrencyField.text = String(format: "%.3f", exchangeRate! * floatdata!)
        }
        

    }
    
    
}
