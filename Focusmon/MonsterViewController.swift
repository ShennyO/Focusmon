//
//  MonsterViewController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/28/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class MonsterViewController: UIViewController {

    //MARK: VARIABLES
    var monster: Monster?
    
    //MARK: OUTLETS
    var monsterImageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    var slotLabel: UILabel = {
        var fontSize = UIScreen.main.bounds.width * 0.05
        var label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        return label
    }()
    
    var monsterDescription: UITextView = {
        var textView = UITextView()
        textView.isUserInteractionEnabled = false
        var fontSize = UIScreen.main.bounds.width * 0.04
        textView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        textView.textAlignment = NSTextAlignment.center
        textView.textColor = UIColor.black
        return textView
    }()
    
    var atkLabel: UILabel = {
        var fontSize = UIScreen.main.bounds.width * 0.04
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        return label
    }()
    
    var atkStatLabel: UILabel = {
        var fontSize = UIScreen.main.bounds.width * 0.033
        var label = UILabel()
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.attackRed
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        label.adjustsFontSizeToFitWidth = true
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        label.clipsToBounds = true
        return label
    }()
    
    var hpLabel: UILabel = {
        var fontSize = UIScreen.main.bounds.width * 0.04
        var label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        return label
    }()
    
    var hpStatLabel: UILabel = {
        var fontSize = UIScreen.main.bounds.width * 0.033
        var label = UILabel()
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.buttonGreen
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: CGFloat(fontSize))
        label.adjustsFontSizeToFitWidth = true
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    let enchantButton: UIButton = {
        let button = UIButton()
        let buttonImage = #imageLiteral(resourceName: "wand")
        button.setBackgroundImage(buttonImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.addTarget(self, action: #selector(toEnchant), for: .touchUpInside)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 232/255, green: 218/255, blue: 35/255, alpha: 1.0).cgColor
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        
        setUpOutlets()
        setUpConstraints()
        enchantButton.addTarget(self, action: #selector(toEnchant), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureLabels()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
    }
    
    func setUpOutlets() {
        
        self.view.addSubview(monsterImageView)
        self.view.addSubview(slotLabel)
        self.view.addSubview(monsterDescription)
        self.view.addSubview(atkLabel)
        self.view.addSubview(atkStatLabel)
        self.view.addSubview(hpLabel)
        self.view.addSubview(hpStatLabel)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: enchantButton)
        guard let monster = monster else {return}
        monsterDescription.text = monster.description
        atkLabel.text = "Atk:"
        hpLabel.text = "Hp:"
        atkStatLabel.text = "\(monster.attack)"
        hpStatLabel.text = "\(monster.health)"
        
    }
    
    private func configureLabels() {
        guard let monster = monster else {return}
        
        monsterImageView.image = monster.image
        if monster.successfulEnchants == 0 {
            self.title = monster.name
        } else {
            self.title = "\(String(describing: monster.name)) +\(String(describing: monster.successfulEnchants))"
        }
        
        slotLabel.text = "\(monster.slot)/7"
        
        let totalAtk = monster.attack + monster.enchantmentAtk
        let totalHp = monster.health + monster.enchantmentHp
        
        atkStatLabel.text = "\(totalAtk) ( +\(monster.enchantmentAtk) )"
        hpStatLabel.text = "\(totalHp) ( +\(monster.enchantmentHp) )"
    
        
        atkStatLabel.textColor = UIColor.white
        atkLabel.textColor = UIColor.newBlack
        
        
        if totalAtk > monster.averageAtk + 25 {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.godGreenColor]
            atkStatLabel.textColor = UIColor.godGreenTextColor
            atkLabel.textColor = UIColor.godGreenColor
        } else if totalAtk > monster.averageAtk + 15 {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.elitePurple]
            atkStatLabel.textColor = UIColor.elitePurpleTextColor
            atkLabel.textColor = UIColor.elitePurple
        } else if totalAtk > monster.averageAtk + 8 {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.labelGold]
            atkStatLabel.textColor = UIColor.abvAvgYellow
            atkLabel.textColor = UIColor.labelGold
        } else if totalAtk < monster.averageAtk - 4 {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.labelGray]
            atkStatLabel.textColor = UIColor.belowAvgGray
            atkLabel.textColor = UIColor.labelGray
        }
        
        if monster.health > monster.averageHealth + 40 {
            hpStatLabel.textColor = UIColor.elitePurple
            hpLabel.textColor = UIColor.elitePurple
        } else if monster.health > monster.averageHealth + 20 {
            hpStatLabel.textColor = UIColor.abvAvgYellow
            hpLabel.textColor = UIColor.labelGold
        } else if monster.health < monster.averageHealth - 10 {
            hpStatLabel.textColor = UIColor.belowAvgGray
            hpLabel.textColor = UIColor.labelGray
        }
    }
    
    func setUpConstraints() {
        
        enchantButton.snp.makeConstraints { (make) in

            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        let imageViewWidthHeight = UIScreen.main.bounds.width * 0.85
        monsterImageView.snp.makeConstraints { (make) in
            let topDistance = UIScreen.main.bounds.height * 0.1974
            make.top.equalToSuperview().offset(topDistance)
            make.centerX.equalToSuperview()
            make.width.equalTo(imageViewWidthHeight)
            make.height.equalTo(imageViewWidthHeight)
        }
        
        slotLabel.snp.makeConstraints { (make) in
            let topDistance = UIScreen.main.bounds.height * 0.2074
            let leftDistance = UIScreen.main.bounds.width * 0.13286
            make.top.equalToSuperview().offset(topDistance)
            make.left.equalToSuperview().offset(leftDistance)
        }
        
        let textViewWidth = UIScreen.main.bounds.width * 0.8
        monsterDescription.snp.makeConstraints { (make) in
            let textViewHeight = UIScreen.main.bounds.height * 0.12048
            make.top.equalTo(monsterImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(textViewWidth)
            make.height.equalTo(textViewHeight)
        }
        atkLabel.snp.makeConstraints { (make) in
            let leftDistance = UIScreen.main.bounds.width * 0.13286
            make.top.equalTo(monsterDescription.snp.bottom).offset(-5)
            make.left.equalToSuperview().offset(leftDistance)
        }
        
        atkStatLabel.snp.makeConstraints { (make) in
            make.left.equalTo(atkLabel.snp.right).offset(10)
            make.top.equalTo(monsterDescription.snp.bottom).offset(-6)
            make.width.equalTo(225)
            make.height.equalTo(20)
        }
        
        hpLabel.snp.makeConstraints { (make) in
            let leftDistance = UIScreen.main.bounds.width * 0.13286
            make.left.equalToSuperview().offset(leftDistance)
            make.top.equalTo(atkLabel.snp.bottom).offset(7)
        }
        
        hpStatLabel.snp.makeConstraints { (make) in
            make.left.equalTo(atkLabel.snp.right).offset(10)
            make.top.equalTo(atkLabel.snp.bottom).offset(6)
            make.width.equalTo(225)
            make.height.equalTo(20)
        }
    }
    
    private func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @objc private func toEnchant() {
        let enchantVC = EnchantViewController()
        
        enchantVC.monster = self.monster
        navigationController?.pushViewController(enchantVC, animated: true)
    }
}
