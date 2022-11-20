//
//  BagViewPresenter.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit

class UnregUsersViewPresenter {
    
    let internetService = InternetService()
                
    weak var viewInput: (UIViewController & UnregUsersViewInput)?
    
    private func loadUnregUsers() {
        internetService.loadUnregisteredUsers{ result in
            switch result {
            case .success(let users):
                self.viewInput?.updateUnregUsers(users: users.unregisteredUsers)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    private func approveUser(id: Int) {
        internetService.putToApproveUser(id: id){ result in
            
        }
    }
    
    private func unblockUser(id: Int) {
        internetService.putToRejectUser(id: id){ result in
            
        }
    }
    
}

extension UnregUsersViewPresenter: UnregUsersViewOutput {
    func viewDidLoadUnregUsers() {
        loadUnregUsers()
    }
    
    func didApproveUser(id: Int) {
        self.approveUser(id: id)
    }
    
    func didRejectUser(id: Int) {
        self.didRejectUser(id: id)
    }

}
