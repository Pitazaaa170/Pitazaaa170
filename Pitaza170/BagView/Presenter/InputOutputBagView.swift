//
//  InputOutputBagView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

protocol BagViewInput {
    
    
    func showError(error: String)
    
    func showNoResults()
    
    func hideNoResults()
    
}

protocol BagViewOutput{
    
    func viewDidSearchEmployees()

}
