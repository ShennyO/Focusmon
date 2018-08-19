//
//  EnchantCell.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/28/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit


protocol enchantmentDelegate {
    func enchantMonster(enchantment: Enchantment)
}


class EnchantCell: UITableViewCell {
    
    //MARK: VARIABLES
    
    var delegate: enchantmentDelegate?
//    var monster: Monster? {
//        didSet {
//            if monster?.slot == 0 {
//                enchantButton.isUserInteractionEnabled = false
//                enchantButton.backgroundColor = UIColor.gray
//                enchantButton.setTitleColor(UIColor.newBlack, for: .normal)
//            } else {
//                enchantButton.isUserInteractionEnabled = true
//                enchantButton.setTitleColor(UIColor.white, for: .normal)
//                enchantButton.backgroundColor = UIColor.buttonGreen
//            }
//        }
//    }
    
    var enchantment: Enchantment? {
        didSet {
//            self.selectionStyle = .none
            addOutlets()
            addConstraints()
            self.selectionStyle = .none
            guard let enchantment = enchantment else {return}
            enchantButton.addTarget(self, action: #selector(enchant), for: .touchUpInside)
            enchantTitleLabel.text = enchantment.name
            enchantImageView.image = enchantment.image
            enchantmentLabel.text = "Enchantment:"
            successRateLabel.text = "- Success Rate: \(enchantment.successRate)%"
            enchantImageView.layer.borderColor = enchantment.borderColor.cgColor
            gemImageView.image = #imageLiteral(resourceName: "gem")
            userGemsLabel.text = "x\(enchantment.price)"
            switch enchantment.type {
            case .attack:
                statsLabel.text = "- Monster Atk + \(enchantment.stats)"
                
            case .health:
                statsLabel.text = "- Monster Hp + \(enchantment.stats)"
            }
        }
    }
    
    //MARK: OUTLETS
    var enchantTitleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        return label
    }()
    
    var enchantImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = 67.5
        return imageView
    }()
    
    var enchantmentLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        return label
    }()
    
    var successRateLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    var statsLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    var gemImageView: UIImageView = {
       var imageView = UIImageView()
        return imageView
    }()
    
    var userGemsLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        return label
    }()
    
    var enchantButton: UIButton = {
        var button = UIButton(type: .system)
        button.clipsToBounds = true
        button.layer.cornerRadius = 14
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.buttonGreen
        button.setTitle("Enchant", for: UIControlState.normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: 1, right: 0)
        return button
    }()
    
    @objc func enchant() {
        guard let enchantment = enchantment else {return}
        delegate?.enchantMonster(enchantment: enchantment)
    }
    
    private func addOutlets() {
        [enchantTitleLabel, enchantImageView, enchantmentLabel, successRateLabel, statsLabel, gemImageView, userGemsLabel].forEach { (view) in
            self.addSubview(view)
        }
        self.contentView.addSubview(enchantButton)
        
    }
    
    private func addConstraints() {
        enchantTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(20)
        }
        
        enchantImageView.snp.makeConstraints { (make) in
            make.top.equalTo(enchantTitleLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(135)
            make.height.equalTo(135)
            
        }
        
        enchantmentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(enchantImageView.snp.top)
            make.left.equalTo(enchantImageView.snp.right).offset(15)
        }
        
        successRateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(enchantmentLabel.snp.bottom).offset(10)
            make.left.equalTo(enchantImageView.snp.right).offset(15)
        }
        
        statsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(successRateLabel.snp.bottom).offset(5)
            make.left.equalTo(enchantImageView.snp.right).offset(15)
        }
        
        gemImageView.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.top.equalTo(statsLabel.snp.bottom).offset(5)
            make.left.equalTo(enchantImageView.snp.right).offset(11)
        }
        
        userGemsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(statsLabel.snp.bottom).offset(20)
            make.left.equalTo(gemImageView.snp.right).offset(-2)
        }
        
        enchantButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(userGemsLabel.snp.bottom)
            make.left.equalTo(userGemsLabel.snp.right).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(85)
        }
        
    }
    
    
}
