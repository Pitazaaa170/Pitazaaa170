//
//  BagViewPresenter.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit

class MarketViewPresenter {
    
    let internetService = InternetService()
                
    weak var viewInput: (UIViewController & MarketViewInput)?
    
    private func loadGlobalCurrencies(){
        internetService.loadGlobalCurrencies{ result in
            switch result {
            case .success(let globalCurrencies):
                self.viewInput?.updateCurrencies(currency: globalCurrencies)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
}

extension MarketViewPresenter: MarketViewOutput {
    
    func viewDidLoadCurrencies() {
        self.loadGlobalCurrencies()
    }
    
}
