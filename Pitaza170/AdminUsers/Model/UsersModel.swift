//
//  UserCurrencyModel.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

struct UsersForAdmin:Codable {
    var registeredUsers:[UserForAdmin]
}

struct UserForAdmin:Codable {
    var id:Int
    var name:String
    var surname:String
    var role:String
    var blocked:Bool
}
