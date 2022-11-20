//
//  BalanceView.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 18.11.2022.
//

import UIKit
import SnapKit

final class InfoCurView: UIView {
    
        
    var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 4
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var balanceLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var growLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .left
        label.sizeToFit()
        label.numberOfLines = 1
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubvies()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubvies()
        setupConstraints()
    }
    
    private func setupSubvies(){
        self.addSubview(image)
        self.addSubview(nameLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(balanceLabel)
        self.addSubview(growLabel)
    }
    
    private func setupConstraints(){
        
        self.image.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.left.equalToSuperview().inset(40)
            make.width.equalTo(45)
            make.height.equalTo(36)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.left.equalTo(image.snp.right).inset(-10)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(30)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.right.equalTo(self.snp.centerX)
            make.top.equalTo(image.snp.bottom).inset(-10)
            make.height.equalTo(36)

        }
        
        self.balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-50)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(36)
        }
        
        self.growLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceLabel.snp.bottom).inset(-5)
            make.left.right.equalToSuperview().inset(40)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()
        
        self.image.clipsToBounds = true
        self.image.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 10
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
    }
    
    func updateInfo(imageNew:UIImage, name:String, descr:String, balance:String, grow:String, positive:Bool){
        image.image = imageNew
        nameLabel.text = name
        descriptionLabel.text = descr
        balanceLabel.text = balance
        growLabel.text = grow
        if positive {
            growLabel.textColor = .systemGreen
        } else {
            growLabel.textColor = .systemRed
        }
    }
    
    func updateImage(newImage: UIImage){
        image.image = newImage
    }
    
}

