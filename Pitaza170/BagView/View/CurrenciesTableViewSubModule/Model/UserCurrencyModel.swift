//
//  UserCurrencyModel.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

struct UserCurrencies:Codable {
    var count:Int
    var currencies:[UserCurrency]
    var rubles:String
    var rublesGrow:String
}

struct UserCurrency:Codable {
    var image:String
    var name:String
    var description:String
    var balance:String
    var grow:String
    var positive:Bool
}
