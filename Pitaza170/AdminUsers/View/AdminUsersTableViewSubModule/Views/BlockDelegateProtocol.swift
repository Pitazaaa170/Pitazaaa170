//
//  BlockDelegateProtocol.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 20.11.2022.
//

import Foundation

protocol BlockDelegateProtocol: AnyObject {
    
    func blockUser(id: Int)
    
    func unblockUser(id: Int)
}
