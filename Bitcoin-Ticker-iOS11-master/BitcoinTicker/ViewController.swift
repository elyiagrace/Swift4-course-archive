//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencyLabels = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var bitcoinPrice : String = "loading..."
    var displayLabel : String = "?"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
       
    }
    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->  String? {
        
        print (currencyArray[row])
        displayLabel = currencyLabels[row]
        print(displayLabel)
        finalURL = baseURL + currencyArray[row]
        didSelectRow(url : finalURL)
        //displayLabel = currencyLabels[currencyArray[row]]
            
        return currencyArray[row]

            }
    
//    
//    //MARK: - Networking
//    /***************************************************************/
//

    func didSelectRow(url: String) {
        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess{
                //print("Success! Got the bitcoin data")
                let bitcoinJSON : JSON = JSON(response.result.value!)
                self.updateBitcoinData(json: bitcoinJSON)
                
            }
            else{
                print("Error \(String(describing: response.result.error))")
                self.bitcoinPriceLabel.text = "Op..."
            }
        }
    }
    
    
    func updateBitcoinData(json: JSON) {
        print(bitcoinPrice)
        bitcoinPrice = json["ask"].stringValue
        updateUIwithBitcoinData()
    }
    
    func updateUIwithBitcoinData(){
        self.bitcoinPriceLabel.text = self.displayLabel + self.bitcoinPrice
    }
        

}
