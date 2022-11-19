//
//  CurrenciesTableView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit
import SnapKit

final class CurrenciesTableView: UIView {
    
    private let  gradient = CAGradientLayer.getSecondCustomGradient()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои валюты"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = nil
        return tableView
    }()
    
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
    
    private func setupSubViews(){
        self.addSubview(self.titleLabel)
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints() {

        self.titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(frame.height / 10)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(frame.height / 10)
            make.left.right.bottom.equalToSuperview().inset(frame.height / 10)
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 6
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        gradient.frame = self.bounds
    }
   
    
}


