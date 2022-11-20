//
//  BagViewPresenter.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit

class BagViewPresenter {
    
    let internetService = InternetService()
                
    weak var viewInput: (UIViewController & BagViewInput)?
    
    init(){
        NotificationCenter.default.addObserver(self, selector: #selector(viewDidLoadRubles), name: NSNotification.Name.updateBag, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(viewDidLoadCurrencies), name: NSNotification.Name.updateBag, object: nil)
    }

    
    private func loadUserCurrencies(){
        internetService.loadUserCurrencies{ result in
            switch result {
            case .success(let userCurrencies):
                self.viewInput?.updateCurrencies(currency: userCurrencies)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    private func loadUserRubles(){
        internetService.loadUserRubles{ result in
            switch result {
            case .success(let userRubles):
                self.viewInput?.updateRubles(rublesBalance: userRubles)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
}

extension BagViewPresenter: BagViewOutput {
    
    func didTapInputButton() {
        viewInput?.showInputRublesView()
    }
    
    func didTapOutputButton() {
        viewInput?.showOutputRublesView()
    }
    
    @objc func viewDidLoadRubles() {
        self.loadUserRubles()
    }
    
    @objc func viewDidLoadCurrencies() {
        self.loadUserCurrencies()
    }
    
    func didInputedRubles(count: Int) {
        //POST рублей на бэк
        self.loadUserRubles()
    }
    
    func didOutputedRubles(count: Int) {
        //POST рублей на бэк
        self.loadUserRubles()
    }
    
}
