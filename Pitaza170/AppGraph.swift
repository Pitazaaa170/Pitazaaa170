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
        // TODO: Make Fabric
        let welcomeLabel: UILabel = {
            let label = UILabel()
            label.text = "Добро пожаловать!"
            label.font = .systemFont(ofSize: 25)
            label.numberOfLines = 1
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
        // TODO: add logo
        let logoImage = UIImageView(image: UIImage(named: "logo"))
        let vc = LoginViewController(
            loginButton: AuthenticationButton(title: "Вход"),
            registrationButton: AuthenticationButton(title: "Регистрация"),
            welcomeLabel: welcomeLabel,
            logoImage: logoImage
        )
        self.init(rootViewController: vc)
    }
}
