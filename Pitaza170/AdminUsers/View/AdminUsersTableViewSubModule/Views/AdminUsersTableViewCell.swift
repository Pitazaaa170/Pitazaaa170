//
//  CurrenciesTableViewCell.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import SnapKit
import UIKit

class AdminUsersTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserCell"
    
    var id = 0
    
    weak var blockDelegate: BlockDelegateProtocol?
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
    
    var blockButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заблокировать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .myOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(blockUser), for: .touchUpInside)
        return button
    }()
    
    @objc func blockUser(sender: UIButton!){
        if sender.titleLabel?.text == "Заблокировать" {
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.blockButton.backgroundColor = .myWhite
                self.blockButton.setTitle("Разблокировать", for: .normal)
            }
            blockDelegate?.blockUser(id: id)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.blockButton.backgroundColor = .myOrange
                self.blockButton.setTitle("Заблокировать", for: .normal)
            }
            blockDelegate?.unblockUser(id: id)
        }
        
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
        contentView.addSubview(blockButton)
    }
    
    private func setupConstraints(){
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-5)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(15)
        }
        
        self.blockButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-10)
            make.left.right.bottom.equalToSuperview().inset(10)
            make.height.equalTo(45)
        }
        
    }
    
    func configure(id: Int,name: String, surname: String, role: String, blocked: Bool) {
        self.id = id
        nameLabel.text = name + " " + surname
        descriptionLabel.text = role
        if blocked {
            blockButton.backgroundColor = .myWhite
            blockButton.setTitle("Разблокировать", for: .normal)
        }
    }
    
    override func layoutSubviews() {
        blockButton.layer.masksToBounds = true
        blockButton.layer.cornerRadius = blockButton.frame.height / 2
    }
}
