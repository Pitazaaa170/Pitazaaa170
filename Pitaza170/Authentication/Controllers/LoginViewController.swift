//
//  ViewController.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 18.11.2022.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private let loginButton: AuthenticationButton
    private let registrationButton: AuthenticationButton
    private let welcomeLabel: UILabel
    private let logoImage: UIImageView
    
    init(
        loginButton: AuthenticationButton,
        registrationButton: AuthenticationButton,
        welcomeLabel: UILabel,
        logoImage: UIImageView
    ) {
        self.loginButton = loginButton
        self.registrationButton = registrationButton
        self.welcomeLabel = welcomeLabel
        self.logoImage = logoImage
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        setUpButtonsLayout()
        setUpLabelLayout()
        setUpLogoLayout()
        
        setUpActions()
    }
    
    override func viewDidLayoutSubviews() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        registrationButton.layer.cornerRadius = registrationButton.frame.height / 2
    }
    
    private func setUpActions() {
        loginButton.addTarget(
            self, action: #selector(buttonTapped(sender:)), for: .touchUpInside
        )
        registrationButton.addTarget(
            self, action: #selector(buttonTapped(sender:)), for: .touchUpInside
        )
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        // TODO: Make Fabric
        let buttonTitle = sender.titleLabel?.text
        let label: UILabel = {
            let label = UILabel()
            label.text = buttonTitle
            label.font = .boldSystemFont(ofSize: 25)
            label.numberOfLines = 1
            label.textColor = .white
            label.textAlignment = .left
            return label
        }()
        let title = buttonTitle == "Вход" ? "Войти" : "Зарегестрироваться"
        let button = AuthenticationButton(title: title)
        let vc = AuthenticationViewController(
            label: label,
            button: button
        )
        present(vc, animated: true)
    }

    // TODO: move to custom GradientView
    private func setGradientBackground() {
        let colorTop =  UIColor.black.cgColor
        let colorBottom = UIColor.purple.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom, colorTop]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = view.bounds
                
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}

// MARK: Set Up Layout

extension LoginViewController {
    private func setUpButtonsLayout() {
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.spacing = InsetsProvider.spacing
            sv.axis = .vertical
            return sv
        }()
        
        for button in [loginButton, registrationButton] {
            stackView.addArrangedSubview(button)
            button.snp.makeConstraints { $0.width.equalTo(view.frame.width / 2) }
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
    
    private func setUpLabelLayout() {
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(loginButton.snp.top).offset(-60)
        }
    }
    
    private func setUpLogoLayout() {
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY)
        }
    }
}
