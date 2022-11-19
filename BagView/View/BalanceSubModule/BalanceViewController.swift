//
//  BalanceViewController.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 18.11.2022.
//
import UIKit

class BalanceViewController: UIViewController {
    
    private var balanceView: BalanceView {
        return self.view as? BalanceView ?? BalanceView()
    }

    var balanceValue: String! {
        didSet {
            balanceView.updateBalance(balance: balanceValue)
        }
    }
    
    var growValue: String! {
        didSet {
            balanceView.updateGrow(grow: growValue)
        }
    }

    // MARK: - Init
    init(balance: String, grow: String) {
        self.balanceValue = balance
        self.growValue = grow
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = BalanceView(frame: CGRect(x: self.view.frame.width / 5, y: self.view.frame.width / 5, width: self.view.frame.width * 0.8 , height: self.view.frame.height * 0.3 ))
        balanceView.updateBalance(balance: balanceValue)
        balanceView.updateGrow(grow: growValue)
    }
    
}
