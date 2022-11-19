//
//  ViewController.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 18.11.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let testView = CurrenciesTableViewController()
        view.addSubview(testView.view)
        testView.view.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.right.left.equalToSuperview().inset(30)
            make.height.equalTo(view.frame.height/2)
        }
        
        testView.userCurrencies = [UserCurrency(
            image: "https://sun9-66.userapi.com/impg/8Ssafron6sY0Ye7t8UhM4TJ9RWKOkoO564I9YQ/rNTM_b8RrzQ.jpg?size=635x1280&quality=95&sign=e54ab09199d4f05f4138374abd2fb912&type=album",
                                                name: "USD", description: "govno", balance: "123,123", grow: "+123", positive: true)]
        
    }
    
}
