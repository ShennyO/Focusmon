//
//  MonsterCollectionCell.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/21/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class MonsterCollectionCell: UICollectionViewCell {
    
    //MARK: VARIABLES
    var monster: Monster?
    
    //MARK: OUTLETS
    var monsterImageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    private func setUpConstraints() {
        monsterImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func configureCell(monster: Monster) {
        self.addSubview(monsterImageView)
        setUpConstraints()
        self.monster = monster
        monsterImageView.image = monster.image
        
    }
    
}
