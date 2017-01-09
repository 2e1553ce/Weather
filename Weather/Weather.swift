//
//  Weather.swift
//  Weather
//
//  Created by aiuar on 09.01.17.
//  Copyright © 2017 A.V. All rights reserved.
//

import Foundation

class Weather {
    
    let cityName: String
    let cityTemp: Int
    
    init(weatherJson: NSDictionary) {
        
        cityName = weatherJson["name"] as! String
        let main = weatherJson["main"] as! NSDictionary
        cityTemp = main["temp"] as! Int
    }
}
