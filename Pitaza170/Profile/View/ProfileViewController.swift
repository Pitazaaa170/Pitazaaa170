//
//  ProfileViewController.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 20.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    // TODO: DI
    private let profileBoard = ProfileBoard(userLogin: " Василий Сидоров")
    private let historyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hystory", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 58/255, green: 41/255, blue: 100/255, alpha: 1)
        button.addTarget(
            self,
            action: #selector(historyButtonTapped(_:)), for: .touchUpInside
        )
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .black
        setUpLayout()
    }

    override func viewDidLayoutSubviews() {
        profileBoard.applyGradient(
            colors: [.myPurple, .myGreen],
            startPoint: CGPoint(x: 0.5, y: 0),
            endPoint: CGPoint(x: 0.5, y: 1)
        )
        let radius: CGFloat = 50
        profileBoard.layer.cornerRadius = radius
        profileBoard.layer.sublayers?.forEach {
            $0.cornerRadius = radius
        }
        historyButton.layer.cornerRadius = historyButton.bounds.height / 2
    }
    
    @objc private func historyButtonTapped(_ sender: Any) {
        // TODO: Add stick on top ?
        let currencies = CurrenciesTableViewController()
        if let presentationController = currencies.presentationController
            as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large()]
        }
        present(currencies, animated: true)
    }
}

// MARK: Set Up Layout

extension ProfileViewController {
    private func setUpLayout() {
        view.addSubview(profileBoard)
        profileBoard.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(80)
            make.width.equalTo(view.snp.width).inset(40)
            make.height.equalToSuperview().dividedBy(7)
        }
        
        view.addSubview(historyButton)
        historyButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
    }
}
