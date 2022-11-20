//
//  BagViewPresenter.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit

class AdminUsersViewPresenter {
    
    let internetService = InternetService()
                
    weak var viewInput: (UIViewController & AdminUsersViewInput)?
    
    private func loadAdminUsers(){
        internetService.loadRegisteredUsers{ result in
            switch result {
            case .success(let users):
                self.viewInput?.updateUsers(users: users.registeredUsers)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    private func blockUser(id: Int) {
        internetService.postToBlockUser(id: id){ result in
            
        }
    }
    
    private func unblockUser(id: Int) {
        internetService.postToBlockUser(id: id){ result in
            
        }
    }
    
}

extension AdminUsersViewPresenter: AdminUsersViewOutput {
    
    func viewDidLoadUsers() {
        self.loadAdminUsers()
    }
    
    func didBlockUser(id: Int) {
        self.blockUser(id: id)
    }
    
    func didUnblockUser(id: Int) {
        self.unblockUser(id: id)
    }
    
}
