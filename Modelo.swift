//
//  Modelo.swift
//
//
//  Created by practica on 8/11/17.
//
//

import Foundation
import Alamofire
import SwiftyJSON

class Modelo {
    
    let currenciesArray = ["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","COP","USD","ARS"]
    let CurrencyArray =
        ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R","$","$","$"]
    
    let Baseurl = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let fmt = NumberFormatter()
    var finalURL : String?
    var signo : String?
    var answer : String?
    
    
    
    func getBitcoinData(url: String) {
        Alamofire.request(url,method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let bitCoinJSON: JSON = JSON(response.result.value!)
                self.updateBitcoinData(json : bitCoinJSON)
            }else{
                print("ERROR: \(response.result.error)")
                //PriceLabel.text
                self.answer = "Se presento un problema en la conexiòn"
                
            }
            
        }
        
    }
    
    func updateBitcoinData(json: JSON){
        if let bitcoinResult = json["ask"].double{
            //PriceLabel.text
            answer = signo! + fmt.string (from: bitcoinResult as NSNumber)!
        }else{
            //PriceLabel.text
            answer =  "servicio no Disponible"
        }
    }
    
    func imprimir ()-> String{
        if let valor = answer {
            return valor
        } else {
            return ""
        }
        
        
    }
    
}


