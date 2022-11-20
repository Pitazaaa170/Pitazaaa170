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
    
    private func approveUser(id: Int, clouser: (() -> Void)?) {
        internetService.putToApproveUser(id: id){ result in
            if result {
                clouser?()
            }
        }
    }
    
    private func unblockUser(id: Int, clouser: (() -> Void)?) {
        internetService.putToRejectUser(id: id){ result in
            if result {
                clouser?()
            }
        }
    }
    
}

extension UnregUsersViewPresenter: UnregUsersViewOutput {
    func didApproveUser(id: Int, clouser: (() -> Void)?) {
        self.approveUser(id: id, clouser: clouser)

    }
    
    func didRejectUser(id: Int, clouser: (() -> Void)?) {
        self.didRejectUser(id: id, clouser: clouser)

    }
    
    func viewDidLoadUnregUsers() {
        loadUnregUsers()
    }

}
