//
//  InputOutputBagView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

protocol AdminUsersViewInput {
    
    func updateUsers(users: [UserForAdmin])
    
}

protocol AdminUsersViewOutput {
    
    func viewDidLoadUsers()
    
    func didBlockUser(id:Int)
    
    func didUnblockUser(id:Int)
}
