//
//  AuthenticationButton.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 18.11.2022.
//

import UIKit

class AuthenticationButton: UIButton {
    private let title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        backgroundColor = .purple
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
