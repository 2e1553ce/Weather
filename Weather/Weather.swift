//
//  Weather.swift
//  Weather
//
//  Created by aiuar on 09.01.17.
//  Copyright © 2017 A.V. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    var cityName: String
    var cityTemp: Int
    var description: String
    var cityCurrentTime: String?
    var icon: UIImage?
    
    init(weatherJson: Dictionary<String, Any>) {
        
        cityName = weatherJson["name"] as! String
        
        let main = weatherJson["main"] as! Dictionary<String, Any>
        cityTemp = main["temp"] as! Int - 273
        
        let weather = weatherJson["weather"] as! Array<Any>
        let zero = weather[0] as! Dictionary<String, Any>
        description = zero["description"] as! String
        
        let dt = weatherJson["dt"] as! Int
        cityCurrentTime = timeFromUnix(unixTime: dt)
        
        icon = weatherIcon(iconString: zero["icon"] as! String)
        
    }
    
    func timeFromUnix(unixTime: Int) -> String {
        
        let timeInSeconds = TimeInterval(unixTime)
        let weatherDate = Date.init(timeIntervalSince1970: timeInSeconds)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: weatherDate)
    }
    
    func weatherIcon(iconString: String) -> UIImage {
        
        let imageName: String
        
        switch iconString {
        case "01d", "01n":
            imageName = "01d"
        case "02d", "02n":
            imageName = "02d"
        case "03d", "03n":
            imageName = "03d"
        case "04d", "04n":
            imageName = "04d"
        case "09d", "09n":
            imageName = "09d"
        case "10d", "10n":
            imageName = "10d"
        case "11d", "11n":
            imageName = "11d"
        case "13d", "13n":
            imageName = "13d"
        case "50d", "50n":
            imageName = "50d"
        default:
            imageName = "01d"
        }
        
        return UIImage(named: imageName)!
    }
}
