//
//  InputOutputBagView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

protocol UnregUsersViewInput {
    
    func updateUnregUsers(users: [UnregisteredUser])
    
}

protocol UnregUsersViewOutput {
    
    func viewDidLoadUnregUsers()
    
    func didApproveUser(id:Int)
    
    func didRejectUser(id:Int)
}
