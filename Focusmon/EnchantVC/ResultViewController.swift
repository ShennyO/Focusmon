//
//  ResultViewController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/28/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //MARK: VARIABLES
    
    var result: Bool!
    var monster: Monster!
    var enchantment: Enchantment!
    
    //MARK: OUTLETS
    
    var resultLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 65)
        return label
    }()
    
    var monsterImageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    var returnButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Return", for: UIControlState.normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 23)
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        button.backgroundColor = UIColor.timeBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 30
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.view.backgroundColor = UIColor.white
        setUpNavBar()
        addOutlets()
        returnButton.addTarget(self, action: #selector(unwindFromResult), for: .touchUpInside)
        setConstraints()
        monsterImageView.image = monster?.image
        configureResults()
        // Do any additional setup after loading the view.
    }
    
    private func configureResults() {
        let name = enchantment.name
        switch name {
        case "Blood Paw":
            
            if result {
                monster.enchantmentAtk += enchantment.stats
                monster.successfulEnchants += 1
                resultLabel.text = "Success!"
            } else {
                resultLabel.text = "Failed..."
            }
            monster.slot -= 1
        case "Fruit Of Life":
            if result {
                monster.enchantmentHp += enchantment.stats
                resultLabel.text = "Success!"
                monster.successfulEnchants += 1
            } else {
                resultLabel.text = "Failed..."
            }
            monster.slot -= 1
            
        default:
            return
        }
    }

    private func setUpNavBar() {
        self.title = "Result"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func addOutlets() {
        [resultLabel, monsterImageView, returnButton].forEach { (view) in
            self.view.addSubview(view)
        }
    }
    
    private func setConstraints() {
        resultLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
        }
        
        let imageViewWidthHeight = UIScreen.main.bounds.width * 0.75
        monsterImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(imageViewWidthHeight)
            make.height.equalTo(imageViewWidthHeight)
        }
        
        returnButton.snp.makeConstraints { (make) in
            make.top.equalTo(monsterImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(60)
        }
        
    }
    
    @objc func unwindFromResult() {
        navigationController?.popViewController(animated: true)
        
    }
    
}
