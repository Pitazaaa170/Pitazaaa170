//
//  AppGraph.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 18.11.2022.
//

import UIKit

protocol AppInerface {
    var rootViewController: UIViewController { get }
}

final class AppGraph: AppInerface {
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    convenience init() {
        let welcomeLabel = LabelFactory.makeLabel(
            text: "Добро пожаловать",
            font: .boldSystemFont(ofSize: 35)
        )
        welcomeLabel.textAlignment = .center
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        let loginVC = LoginViewController(
            loginButton: AuthenticationButton(title: "Вход"),
            registrationButton: AuthenticationButton(title: "Регистрация"),
            welcomeLabel: welcomeLabel,
            logoImage: logoImage
        )
        let bagVC = BagViewController(presenter: BagViewPresenter())
        
        // TODO: добавить проверку: авторизован пользователь или нет
        let pres = MarketViewPresenter()
        var url = "https://sun9-66.userapi.com/impg/8Ssafron6sY0Ye7t8UhM4TJ9RWKOkoO564I9YQ/rNTM_b8RrzQ.jpg?size=635x1280&quality=95&sign=e54ab09199d4f05f4138374abd2fb912&type=album"
        let vc = MarketViewController(presenter: pres )
        pres.viewInput = vc
        vc.currencuesTableViewController.globalCurrencies = [GlobalCurrency(image: url, name: "USD", description: "dollar", balance: "123.123", grow: "+123", positive: true)]
        let rootVC = vc //false ? bagVC : loginVC
        self.init(rootViewController: NavigationMenuBaseController())
    }
}
