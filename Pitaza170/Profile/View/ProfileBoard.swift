//
//  ProfileBoard.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 19.11.2022.
//

import UIKit

class ProfileBoard: UIStackView {
    private let userLogin: UILabel
    private var userImage: UIImageView? = nil
    
    init(userLogin: String, userImage: String? = nil) {
        self.userLogin = LabelFactory.makeLabel(
            text: userLogin, font: .systemFont(ofSize: 35)
        )
        self.userLogin.numberOfLines = 0
        if let userImage {
            self.userImage = UIImageView(image: UIImage(named: userImage))
        }
        super.init(frame: .zero)
        setUpLayout()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        if let userImage {
            addArrangedSubview(userImage)
        }
        addArrangedSubview(userLogin)
        backgroundColor = .black
        axis = .horizontal
        distribution = .fillEqually
    }
}
