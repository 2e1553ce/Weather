//
//  ViewController.swift
//  Weather
//
//  Created by aiuar on 03.01.17.
//  Copyright © 2017 A.V. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    let apiKey = "897828dded8aeb4097d9af5b68b9c754"
    var url = "http://api.openweathermap.org/data/2.5/weather?q="

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getTemperature(city: "Moscow")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: Get temperature for city
    func getTemperature(city: String) {
        
        let tempPath = url + city + "&appid=" + apiKey
        let tempUrl = URL(string: tempPath)
        
        URLSession.shared.dataTask(with:tempUrl!) { (data, response, error) in
            if error != nil {
                print(error ?? "url error")
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    let weather = Weather(weatherJson: parsedData)

                    DispatchQueue.main.async {
                        self.iconImageView.image = weather.icon
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
    }
}

