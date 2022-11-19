//
//  InputOutputBagView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

protocol BagViewInput {
    
    func showInputRublesView()
    
    func showOutputRublesView()
    
    func updateRubles(rublesBalance: UserRubles)
    
    func updateCurrencies(currency: UserCurrencies)
    
}

protocol BagViewOutput {
    
    func viewDidLoadCurrencies()
    
    func viewDidLoadRubles()

    func didInputedRubles(count: Int)
    
    func didOutputedRubles(count: Int)
}
