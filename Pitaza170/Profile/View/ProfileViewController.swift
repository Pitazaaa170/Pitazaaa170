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
    private let historySheetVC = HistorySheetVC(
        historyTable: CurrenciesTableViewController()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .black
        setUpLayout()
    }

    override func viewDidLayoutSubviews() {
        profileBoard.applyGradient(
            colors: [.purple, .green],
            startPoint: CGPoint(x: 0.7, y: 0.8),
            endPoint: CGPoint(x: 1, y: 0)
        )
        let radius: CGFloat = 15
        profileBoard.layer.cornerRadius = radius
        profileBoard.layer.sublayers?.forEach {
            $0.cornerRadius = radius
        }
        present(historySheetVC, animated: true)
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
    }
}
