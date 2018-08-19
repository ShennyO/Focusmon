//
//  MonstersHeaderView.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/21/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

protocol monsterHeaderDelegate {
    func sendMonster(monster: Monster)
}

class MonstersHeaderView: UICollectionReusableView {

    //MARK: VARIABLES
    var delegate: monsterHeaderDelegate? = nil
    {
        didSet {
            addGesturesToImageViews()
        }
    }
    var monsters: [Monster] = []
    
    //MARK: UICOMPONENTS
    var profileImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var profileTitleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 35)
        return label
    }()
    
    var rankingLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        return label
    }()
    
    var gemImage: UIImageView = {
        var imageView = UIImageView(image: #imageLiteral(resourceName: "gem"))
        return imageView
    }()
    
    var gemAmountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    var monsterOneImageView = UIImageView()
    var monsterTwoImageView = UIImageView()
    var monsterThreeImageView = UIImageView()
    
    var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    private func addOutlets() {
        [profileImageView, profileTitleLabel, rankingLabel, gemAmountLabel, gemImage, monsterOneImageView, monsterTwoImageView, monsterThreeImageView, separatorLine].forEach { (outlet) in
            self.addSubview(outlet)
        }
    }
    
    private func setConstraints() {
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        
        profileTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalTo(profileImageView.snp.right).offset(15)
        }
        
        rankingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileTitleLabel.snp.bottom)
            make.left.equalTo(profileImageView.snp.right).offset(15)
        }
        
        gemAmountLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(35)
            make.right.equalToSuperview()
        }
        
        gemImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(25)
            make.right.equalTo(gemAmountLabel.snp.left)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        
        monsterTwoImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-55)
            make.width.equalTo(125)
            make.height.equalTo(125)
        }
        
        monsterOneImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(monsterTwoImageView.snp.top).offset(35)
            make.width.equalTo(175)
            make.height.equalTo(175)
        }
        
        
        
        monsterThreeImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-55)
            make.width.equalTo(125)
            make.height.equalTo(125)
        }
        
        separatorLine.snp.makeConstraints { (make) in
            make.height.equalTo(2)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-25)
        }
        
    }
    
    
    
    private func addGesturesToImageViews() {
        
        [monsterOneImageView, monsterTwoImageView, monsterThreeImageView].forEach { (imageView) in
            imageView.isUserInteractionEnabled = true
        }
    
        let imageViewGestureOne = UITapGestureRecognizer(target: self, action: #selector(selectedMonsterOne))
        
        let imageViewGestureTwo = UITapGestureRecognizer(target: self, action: #selector(selectedMonsterTwo))
        
        let imageViewGestureThree = UITapGestureRecognizer(target: self, action: #selector(selectedMonsterThree))
        
        monsterOneImageView.addGestureRecognizer(imageViewGestureOne)
        monsterTwoImageView.addGestureRecognizer(imageViewGestureTwo)
        monsterThreeImageView.addGestureRecognizer(imageViewGestureThree)
    }
    
    @objc func selectedMonsterOne() {
        delegate?.sendMonster(monster: monsters[0])
    }
    
    @objc func selectedMonsterTwo() {
        delegate?.sendMonster(monster: monsters[1])
    }
    
    @objc func selectedMonsterThree() {
        delegate?.sendMonster(monster: monsters[2])
    }
    
    private func setCornerRadiuses() {
        profileImageView.layer.cornerRadius = 35
        profileImageView.clipsToBounds = true
        monsterTwoImageView.layer.borderWidth = 4
        monsterTwoImageView.layer.cornerRadius = 62.5
        monsterTwoImageView.clipsToBounds = true
        monsterOneImageView.layer.borderWidth = 4
        monsterOneImageView.layer.cornerRadius = 87.5
        monsterOneImageView.clipsToBounds = true
        monsterThreeImageView.layer.borderWidth = 4
        monsterThreeImageView.layer.cornerRadius = 62.5
        monsterThreeImageView.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        for _ in 0...3 {
            let randomNumber = Int(arc4random_uniform(13))
            let newMonster = Monsters.createNewMonster(randomInt: randomNumber)
            monsters.append(newMonster)
        }
        self.addOutlets()
        setCornerRadiuses()
        self.setConstraints()
        self.backgroundColor = UIColor.white
        self.profileImageView.image = #imageLiteral(resourceName: "Sunny")
        self.profileTitleLabel.text = "Sunny"
        self.rankingLabel.text = "1457"
        self.gemAmountLabel.text = "x100"
        
        self.monsterTwoImageView.image = monsters[1].image
        self.monsterOneImageView.image = monsters[0].image
        self.monsterThreeImageView.image = monsters[2].image
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
