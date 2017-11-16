//
//  ViewController.swift
//  CurrencyBitcoinsConverter
//
//  Created by practica on 1/11/17.
//  Copyright © 2017 practica. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var CurrencyPicker: UIPickerView!
    
    let currenciesArray = ["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","COP","USD","ARS"]
    let CurrencyArray =
        ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "$",  "$", "R"]
    
    let Baseurl = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let fmt = NumberFormatter()
    var finalURL : String?
    var signo : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrencyPicker.delegate = self
        CurrencyPicker.dataSource = self
        fmt.numberStyle = .decimal
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currenciesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currenciesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currenciesArray[row])
        finalURL = Baseurl + currenciesArray[row]
        signo = CurrencyArray[row]
        getBitcoinData(url: finalURL! )
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - NETWORKING
    
    func getBitcoinData(url: String){
        Alamofire.request(url,method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let bitCoinJSON: JSON = JSON(response.result.value!)
                self.updateBitcoinData(json : bitCoinJSON)
            }else{
                print("ERROR: \(response.result.error)")
                self.PriceLabel.text = "Se presento un problema en la conexiòn"
            }
        }
    }
    
    func updateBitcoinData(json: JSON){
        if let bitcoinResult = json["ask"].double{
            PriceLabel.text = signo! + fmt.string (from: bitcoinResult as NSNumber)!
        }else{
            PriceLabel.text =  "servicio no Disponible"
        }
    }
    
    
        
   
    
    
    
    
    
}

