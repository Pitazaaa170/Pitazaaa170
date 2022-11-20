//
//  BagViewPresenter.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit

class CurrencyInfoViewPresenter {
    
    let internetService = InternetService()
                
    weak var viewInput: (UIViewController & CurrencyInfoViewInput)?
    
    
}

extension CurrencyInfoViewPresenter: CurrencyInfoViewOutput {
    func didTapBuyButton() {
        viewInput?.showBuyView()
    }
    
    func didTapSellButton() {
        viewInput?.showSellView()
    }
    
    func didBuy(count: Int) {
        //POST
        NotificationCenter.default.post(name: .updateBag, object: nil)
    }
    
    func didSell(count: Int) {
        //POST
        NotificationCenter.default.post(name: .updateBag, object: nil)
    }
    
 
    
}
