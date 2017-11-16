//
//  Modelo.swift
//  
//
//  Created by practica on 8/11/17.
//
//

import Foundation


struct Modelo {
    let currenciesArray = ["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","COP","USD","ARS"]
    let CurrencyArray =
        ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R","$","$","$"]
    
    let Baseurl = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let fmt = NumberFormatter()
    var finalURL : String?
    var signo : String?
}
