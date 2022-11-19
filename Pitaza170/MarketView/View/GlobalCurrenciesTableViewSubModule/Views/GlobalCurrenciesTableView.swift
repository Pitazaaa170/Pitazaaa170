//
//  CurrenciesTableView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import UIKit
import SnapKit

final class GlobalCurrenciesTableView: UIView {
        
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 55
        tableView.backgroundColor = nil
        return tableView
    }()
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.isTranslucent = true
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.leftView?.tintColor = .white
        searchBar.searchTextField.rightViewMode = .never
        searchBar.searchTextField.textColor = .white
        return searchBar
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
        self.addSubview(self.tableView)
        self.addSubview(self.searchBar)
    }
    
    private func setupConstraints() {
        self.searchBar.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).inset(-5)
            make.left.right.bottom.equalToSuperview().inset(10)
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        gradient.frame = self.bounds
        
    }
   
    
}


