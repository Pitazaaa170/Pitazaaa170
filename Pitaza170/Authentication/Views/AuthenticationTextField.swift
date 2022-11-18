//
//  AuthenticationTextField.swift
//  Pitaza170
//
//  Created by Глеб Фандеев on 19.11.2022.
//

import UIKit

class AuthenticationTextField: UITextField {
    init(text: String? = nil) {
        super.init(frame: .zero)
        self.text = " " + (text ?? "")
        backgroundColor = .gray
        textAlignment = .left
        textColor = .lightGray
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
