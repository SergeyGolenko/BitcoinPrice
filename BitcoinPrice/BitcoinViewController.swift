//
//  ViewController.swift
//  BitcoinPrice
//
//  Created by Сергей Голенко on 18.02.2021.
//

import UIKit
import Alamofire
import SwiftyJSON


class BitcoinViewController: UIViewController {
    
    //MARK: Property
    var baseURL : String  { "https://api.nomics.com/v1/currencies/ticker?key=9efd5f974b22088e1fd0b7e27be022e1&ids=BTC,ETH,XRP&interval=1d,30d&convert=\(self.convertValut)&per-page=100&page=1"
    }
    
    let KEY_Bitcoin = "9efd5f974b22088e1fd0b7e27be022e1"
    
    var convertValut = "EUR"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var pickerCurrency: UIPickerView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: Place your 3 UIPickerView delegate methods here
        pickerCurrency.delegate = self
        pickerCurrency.dataSource = self
    }
    //    //MARK: - Networking
    //    /***************************************************************/
    
        func getBitcoinPrice(url: String) {
            AF.request(url,method: .get)
                .responseJSON { response in
                    if response.error != nil {
                        print("Error")
                        self.priceLabel.text = "Connection Issues"
                    } else {
                        //
                        print("Sucess! Got the weather data")
                        let bitcoinJSON : JSON = JSON(response.value!)
                        self.updateBitcoinData(json: bitcoinJSON)
                    }
                }
    
        }
    
    //    //MARK: - JSON Parsing
    //    /***************************************************************/
        func updateBitcoinData(json : JSON) {
            let result = json[0]["price"].string
            priceLabel.text = result
        }
    
}


extension BitcoinViewController : UIPickerViewDataSource {
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

extension BitcoinViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        convertValut = currencyArray[row]
        getBitcoinPrice(url: baseURL)
    }
}

