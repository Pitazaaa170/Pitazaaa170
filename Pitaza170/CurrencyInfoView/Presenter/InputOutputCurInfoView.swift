//
//  InputOutputBagView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

protocol CurrencyInfoViewInput {
    
    func showBuyView()
    
    func showSellView()
    
    func updateCurrencies(currency: GlobalCurrency)
    
}

protocol CurrencyInfoViewOutput {
    
    func didTapBuyButton()
    
    func didTapSellButton()

    func didBuy(count: Int)
    
    func didSell(count: Int)
}
