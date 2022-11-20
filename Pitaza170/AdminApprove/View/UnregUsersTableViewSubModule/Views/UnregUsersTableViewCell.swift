//
//  CurrenciesTableViewCell.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import SnapKit
import UIKit

class UnregUsersTableViewCell: UITableViewCell {
    
    static let identifier: String = "UnregUserCell"
    
    weak var approveDelegate: ApproveUserProtocol?
    
    var id = 0
    
//
//    var image: UIImageView = {
//        var image = UIImageView()
//        image.contentMode = .scaleAspectFill
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var approveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Одобрить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .myPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(approveUserButton), for: .touchUpInside)
        return button
    }()
    
    @objc func approveUserButton() {
        approveDelegate?.approveUser(id: id)
    }
    
    var rejectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отклонить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .myGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rejectUserButton), for: .touchUpInside)
        return button
    }()
    
    @objc func rejectUserButton() {
        approveDelegate?.rejectUser(id: id)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubvies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubvies(){
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(approveButton)
        contentView.addSubview(rejectButton)
    }
    
    private func setupConstraints(){
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(5)
            make.height.equalTo(20)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-5)
            make.left.right.equalToSuperview().inset(5)
            make.height.equalTo(15)
        }
        
        self.approveButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-5)
            make.left.bottom.equalToSuperview().inset(5)
            make.right.equalTo(contentView.snp.centerX).inset(-5)
            make.height.equalTo(45)
        }
        
        self.rejectButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-5)
            make.right.bottom.equalToSuperview().inset(5)
            make.left.equalTo(contentView.snp.centerX).inset(5)
            make.height.equalTo(45)
        }
        
    }
    
    func configure(id: Int,name:String, surname:String, role:String){
        nameLabel.text = name + " " + surname
        descriptionLabel.text = role
    }
    
    override func layoutSubviews() {
        approveButton.layer.masksToBounds = true
        approveButton.layer.cornerRadius = approveButton.frame.width / 2
        
        rejectButton.layer.masksToBounds = true
        rejectButton.layer.cornerRadius = rejectButton.frame.width / 2
    }
}
