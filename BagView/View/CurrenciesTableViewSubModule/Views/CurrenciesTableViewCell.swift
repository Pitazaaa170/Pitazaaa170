//
//  CurrenciesTableViewCell.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import SnapKit
import UIKit

class CurrenciesTableViewCell: UITableViewCell {
    
    static let identifier: String = "CurrenciesCell"

    var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
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
    
    var balanceLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var growLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .right
        label.numberOfLines = 1
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubvies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubvies(){
        contentView.addSubview(image)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(balanceLabel)
        contentView.addSubview(growLabel)
    }
    
    private func setupConstraints(){
        
        self.image.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(5)
            make.width.equalTo(45)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.equalTo(image.snp.right).inset(-10)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(5)
            make.left.equalTo(image.snp.right).inset(-10)
            make.bottom.equalToSuperview().inset(5)
        }
        
        self.balanceLabel.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(5)
            make.left.equalTo(nameLabel.snp.right).inset(5)
        }
        
        self.growLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceLabel.snp.bottom).inset(5)
            make.bottom.right.equalToSuperview().inset(5)
            make.left.equalTo(descriptionLabel.snp.right).inset(5)
        }
    }
    
    func configure(curImage:UIImage,name:String,description:String,balance:String,grow:String,positive:Bool){
        image.image = curImage
        nameLabel.text = name
        descriptionLabel.text = description
        balanceLabel.text = balance
        growLabel.text = grow
        
        if positive {
            growLabel.textColor = .systemGreen
        } else {
            growLabel.textColor = .systemRed
        }
    }
    
    override func layoutSubviews() {
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.frame.width / 2
    }
}
