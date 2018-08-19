//
//  HatchViewController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/16/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit
import SnapKit

class HatchViewController: UIViewController {

    //MARK: VARIABLES
    var gems: Int = 100
    var eggPrice: Int = 15
    
    //MARK: OUTLETS
    
    var userGemsLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    var userGems: UIImageView = {
        var imageView = UIImageView(image: #imageLiteral(resourceName: "gem"))
        return imageView
    }()
    
    
    var eggGemsLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    var eggGems: UIImageView = {
        var imageView = UIImageView(image: #imageLiteral(resourceName: "gem"))
        return imageView
    }()
    
    var eggImageView: UIImageView = {
        var imageView = UIImageView(image: #imageLiteral(resourceName: "greenEgg"))
        return imageView
    }()
    
    var hatchButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(toNewMonster), for: .touchUpInside)
        let cornerRadius = UIScreen.main.bounds.width * 0.7 * 0.0862
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 23)
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        button.setTitle("Hatch", for: .normal)
        button.backgroundColor = UIColor.buttonGreen
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavBar()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setUpOutlets()
        setUpConstraints()
        self.title = "Hatch"
        self.userGemsLabel.text = "x\(gems)"
        self.eggGemsLabel.text = "x\(eggPrice)"
        // Do any additional setup after loading the view.
    }
    
    private func setUpOutlets() {
        self.view.addSubview(eggImageView)
        self.view.addSubview(hatchButton)
        self.view.addSubview(userGemsLabel)
        self.view.addSubview(eggGemsLabel)
        self.view.addSubview(userGems)
        self.view.addSubview(eggGems)
    }
    
    
    private func setUpConstraints() {
        let imageViewWidthHeight = UIScreen.main.bounds.width * 0.9
        
        userGemsLabel.snp.makeConstraints { (make) in
            let topDistance = UIScreen.main.bounds.height * 0.1904
            make.top.equalToSuperview().offset(topDistance)
            make.right.equalToSuperview().offset(-15)
            make.width.equalTo(55)
            make.height.equalTo(50)
        }
        
        userGems.snp.makeConstraints { (make) in
            let topDistance = UIScreen.main.bounds.height * 0.1964
            make.top.equalToSuperview().offset(topDistance)
            make.right.equalTo(userGemsLabel.snp.left).offset(5)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        eggGems.snp.makeConstraints { (make) in
            let leftDistance = UIScreen.main.bounds.width * 0.16
            make.left.equalToSuperview().offset(leftDistance)
            make.bottom.equalTo(hatchButton.snp.top).offset(-5)
            make.width.equalTo(30)
            make.height.equalTo(30)
            
        }
        
        eggGemsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(eggGems.snp.right)
            make.bottom.equalTo(hatchButton.snp.top).offset(10)
            make.width.equalTo(55)
            make.height.equalTo(50)
        }
        
        eggImageView.snp.makeConstraints { (make) in
            let topDistance = UIScreen.main.bounds.height * 0.1974
            make.top.equalToSuperview().offset(topDistance)
            make.centerX.equalToSuperview()
            make.width.equalTo(imageViewWidthHeight)
            make.height.equalTo(imageViewWidthHeight)
        }
        
        hatchButton.snp.makeConstraints { (make) in
            let buttonWidth = UIScreen.main.bounds.width * 0.7
            let buttonHeight = UIScreen.main.bounds.height * 0.0792
            make.top.equalTo(eggImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
    }

    private func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc private func toNewMonster() {
        let newMonsterVC = MonsterViewController()
        
        let randomNumber = Int(arc4random_uniform(13))
        newMonsterVC.monster = Monsters.createNewMonster(randomInt: randomNumber)
        navigationController?.pushViewController(newMonsterVC, animated: true)
    }
    
}
