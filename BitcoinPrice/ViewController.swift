//
//  ViewController.swift
//  BitcoinPrice
//
//  Created by Сергей Голенко on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Property
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var pickerCurrency: UIPickerView!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: Place your 3 UIPickerView delegate methods here
        pickerCurrency.delegate = self
        pickerCurrency.dataSource = self
    }
    
    
    //
    //    //MARK: - Networking
    //    /***************************************************************/
    //
    //    func getWeatherData(url: String, parameters: [String : String]) {
    //
    //        Alamofire.request(url, method: .get, parameters: parameters)
    //            .responseJSON { response in
    //                if response.result.isSuccess {
    //
    //                    print("Sucess! Got the weather data")
    //                    let weatherJSON : JSON = JSON(response.result.value!)
    //
    //                    self.updateWeatherData(json: weatherJSON)
    //
    //                } else {
    //                    print("Error: \(String(describing: response.result.error))")
    //                    self.bitcoinPriceLabel.text = "Connection Issues"
    //                }
    //            }
    //
    //    }
    
    //    //MARK: - JSON Parsing
    //    /***************************************************************/
    //
    //    func updateWeatherData(json : JSON) {
    //
    //        if let tempResult = json["main"]["temp"].double {
    //
    //        weatherData.temperature = Int(round(tempResult!) - 273.15)
    //        weatherData.city = json["name"].stringValue
    //        weatherData.condition = json["weather"][0]["id"].intValue
    //        weatherData.weatherIconName =    weatherData.updateWeatherIcon(condition: weatherData.condition)
    //        }
    //
    //        updateUIWithWeatherData()
    //    }
    //
}



extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
  
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    
}

extension ViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
    }
}

