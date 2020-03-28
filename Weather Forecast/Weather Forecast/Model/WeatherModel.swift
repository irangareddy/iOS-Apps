//
//  WeatherModel.swift
//  Weather Forecast
//
//  Created by RANGA REDDY NUKALA on 26/03/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Float
    
    var temperatureString: String {
        
        return String(format: "%.1f", temperature)
    }
    
    var conditionName:String{
        
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"

        }
    }

}
