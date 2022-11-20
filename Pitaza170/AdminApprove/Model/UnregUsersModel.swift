//
//  UserCurrencyModel.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

struct UnregisteredUsers:Codable {
    var unregisteredUsers:[UnregisteredUser]
}

struct UnregisteredUser:Codable {
    var id: Int
    var name: String
    var surname: String
    var role: String
}

struct PutUsersStruct:Codable {
    var userId: Int
    var registrationApprove: Bool
}
