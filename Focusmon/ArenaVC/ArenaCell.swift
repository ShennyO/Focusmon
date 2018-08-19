//
//  ArenaCell.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/29/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class ArenaCell: UITableViewCell {

    //MARK: OUTLETS
    
    var profileImageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    var profileNameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        return label
    }()
    
    var profileRankingLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    var battleButton: UIButton = {
        var button = UIButton()
        button.clipsToBounds = true
        button.setImage(#imageLiteral(resourceName: "sword"), for: .normal)
        return button
    }()
    
    var monsterOne: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    var monsterTwo: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    var monsterThree: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    private func addOutlets() {
        [profileImageView, profileNameLabel, profileRankingLabel, battleButton, monsterOne, monsterTwo, monsterThree].forEach { (view) in
            self.addSubview(view)
        }
    }
    
    private func setConstraints() {
        profileImageView.snp.makeConstraints { (make) in
            make.width.equalTo(75)
            make.height.equalTo(75)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        
        profileNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.top)
            make.left.equalTo(profileImageView.snp.right).offset(5)
        }
        
        profileRankingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileNameLabel.snp.bottom)
            make.left.equalTo(profileImageView.snp.right).offset(5)
        }
        
        battleButton.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.top.equalTo(profileRankingLabel.snp.bottom)
            make.left.equalTo(profileImageView.snp.right).offset(5)
        }
        
        monsterOne.snp.makeConstraints { (make) in
            make.height.equalTo(75)
            make.width.equalTo(75)
            make.centerY.equalToSuperview()
            make.left.equalTo(battleButton.snp.right).offset(25)
        }
        
        monsterTwo.snp.makeConstraints { (make) in
            make.height.equalTo(75)
            make.width.equalTo(75)
            make.centerY.equalToSuperview()
            make.left.equalTo(monsterOne.snp.right).offset(5)
        }
        
        monsterThree.snp.makeConstraints { (make) in
            make.height.equalTo(75)
            make.width.equalTo(75)
            make.centerY.equalToSuperview()
            make.left.equalTo(monsterTwo.snp.right).offset(5)
        }
        
    }
    
    func setUp() {
        self.selectionStyle = .none
        addOutlets()
        setConstraints()
        profileImageView.image = #imageLiteral(resourceName: "maleTrainer")
        profileNameLabel.text = "Player1"
        profileRankingLabel.text = "1357"
        battleButton.layer.cornerRadius = 17.5
        battleButton.layer.borderWidth = 2
        monsterOne.image = #imageLiteral(resourceName: "cutemon")
        monsterTwo.image = #imageLiteral(resourceName: "Cotsucomon")
        monsterThree.image = #imageLiteral(resourceName: "Daipenmon")
    }

}
