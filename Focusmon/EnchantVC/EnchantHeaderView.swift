//
//  EnchantHeaderView.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/27/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class EnchantHeaderView: UIView {

    //MARK: VARIABLES
    var monster: Monster?
    
    
    //MARK: OUTLETS
    var monsterImageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    
    var gemImageView = UIImageView()
    
    var slotsLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        return label
    }()
    
    var userGemAmount: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private func addOutlets() {
        [monsterImageView, gemImageView, userGemAmount, separatorLine, slotsLabel].forEach { (outlet) in
            self.addSubview(outlet)
        }
    }
    
    private func setConstraints() {
        monsterImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        slotsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(monsterImageView.snp.right)
            make.top.equalTo(monsterImageView)
        }
        
        userGemAmount.snp.makeConstraints { (make) in
            make.top.equalTo(monsterImageView.snp.centerY).offset(-7)
            make.right.equalToSuperview().offset(-20)
        }
        
        gemImageView.snp.makeConstraints { (make) in
            make.top.equalTo(monsterImageView.snp.centerY).offset(-14)
            make.right.equalTo(userGemAmount.snp.left).offset(2)
            make.width.equalTo(30)
            make.height.equalTo(30)
            
        }
        
        separatorLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(0.5)
            make.right.equalToSuperview()
        }
    }
    
     init(frame: CGRect, monster: Monster) {
        super.init(frame: frame)
        self.monster = monster
        self.backgroundColor = UIColor.white
        
        addOutlets()
        setConstraints()
        self.monsterImageView.image = monster.image
        self.gemImageView.image = #imageLiteral(resourceName: "gem")
        self.slotsLabel.text = "\(monster.slot)/7"
        self.userGemAmount.text = "x100"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
