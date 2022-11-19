//
//  BalanceView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 18.11.2022.
//

import UIKit
import SnapKit

final class BalanceView: UIView {
    
    private let  gradient = CAGradientLayer.getFirstCustomGradient()
    
    // MARK: - Subviews
    private var balanceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Баланс"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.alpha = 0.5
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        return label
    }()
    
    private var growLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.addSublayer(gradient)
        self.setupSubViews()
        self.setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.addSublayer(gradient)
        self.setupSubViews()
        self.setupConstraints()
    }
    
    // MARK: - UI
    private func setupSubViews(){
        self.addSubview(self.balanceDescriptionLabel)
        self.addSubview(self.balanceLabel)
        self.addSubview(self.growLabel)
    }
    
    private func setupConstraints() {

        self.balanceDescriptionLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(frame.height / 10)
        }
        
        self.balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceDescriptionLabel).inset(frame.height / 2)
            make.left.right.equalToSuperview().inset(frame.height / 10)
        }
        
        self.growLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceLabel).inset(frame.height / 5)
            make.left.right.equalToSuperview().inset(frame.height / 10)
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 6
        
        gradient.frame = self.bounds
    }
    
    func updateBalance(balance: String){
        balanceLabel.text = balance

    }
    
    func updateGrow(grow: String){
        growLabel.text = grow
    }
    
}

