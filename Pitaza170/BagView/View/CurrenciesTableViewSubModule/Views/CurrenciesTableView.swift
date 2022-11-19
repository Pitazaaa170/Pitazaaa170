//
//  CurrenciesTableView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit
import SnapKit

final class CurrenciesTableView: UIView {
    // TODO: Make DI to use it in history table in profile page
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои валюты"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 55
        tableView.backgroundColor = nil
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupSubViews()
        self.setupConstraints()
    }
    
    private func setupSubViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints() {

        self.titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(10)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            make.left.right.bottom.equalToSuperview().inset(10)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
