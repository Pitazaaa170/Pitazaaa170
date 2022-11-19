//
//  UserModel.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 19.11.2022.
//

import Foundation

struct User {
    let avatar: String?
    let login: String
    
    init(avatar: String?, login: String) {
        self.avatar = avatar
        self.login = login
    }
}

enum UserType {
    case admin, user
}
