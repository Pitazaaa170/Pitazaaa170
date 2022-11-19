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
        let rootVC = ProfileViewController() //false ? bagVC : loginVC
        self.init(rootViewController: rootVC)
    }
}
