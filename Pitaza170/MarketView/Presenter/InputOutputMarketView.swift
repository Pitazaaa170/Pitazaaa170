//
//  InputOutputBagView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

protocol MarketViewInput {
    
    func updateCurrencies(currency: GlobalCurrencies)
    
}

protocol MarketViewOutput {
    
    func viewDidLoadCurrencies()
    
}
