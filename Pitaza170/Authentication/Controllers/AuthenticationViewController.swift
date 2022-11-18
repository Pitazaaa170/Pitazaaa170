//
//  AuthenticationViewController.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 19.11.2022.
//

import UIKit

class AuthenticationViewController: UIViewController {
    private let label: UILabel
    private let button: AuthenticationButton
    
    private let loginTF = AuthenticationTextField(text: "Войти")
    private let passwordTF = AuthenticationTextField(text: "Пароль")
    
    init(label: UILabel, button: AuthenticationButton) {
        self.label = label
        self.button = button
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpLayout()
    }
    
    override func viewDidLayoutSubviews() {
        for element in [button, loginTF, passwordTF] {
            element.layer.cornerRadius = element.frame.height / 2
        }
    }

}

// MARK: Set Up Layout

extension AuthenticationViewController {
    private func setUpLayout() {
        let centerView = UIView()
        view.addSubview(centerView)
        centerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-100)
            make.height.equalTo(view.frame.height / 2)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        centerView.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(80)
        }
        
        let inputStack: UIStackView = {
            let stack = UIStackView(
                arrangedSubviews: [loginTF, passwordTF]
            )
            stack.distribution = .fillEqually
            stack.axis = .vertical
            stack.spacing = InsetsProvider.spacing
            return stack
        }()
        centerView.addSubview(inputStack)
        inputStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(100)
        }
        
        centerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(2)
            make.bottom.equalTo(inputStack.snp.top).inset(-30)
            make.leading.equalTo(view.snp.leading).inset(100)
        }
        
    }
}
