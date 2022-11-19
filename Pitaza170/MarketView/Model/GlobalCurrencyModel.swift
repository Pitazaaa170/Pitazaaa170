//
//  UserCurrencyModel.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

struct GlobalCurrencies:Codable {
    var currencies:[GlobalCurrency]
}

struct GlobalCurrency:Codable {
    var image:String
    var name:String
    var description:String
    var balance:String
    var grow:String
    var positive:Bool
}
