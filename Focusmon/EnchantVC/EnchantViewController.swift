//
//  EnchantViewController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/25/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit
import SnapKit

class EnchantViewController: UIViewController {

    //MARK: VARIABLES
    var monster: Monster?
    var sendResult: Bool!
    var enchantments = [Enchantment(name: "Blood Paw", successRate: 60, stats: 3, image: #imageLiteral(resourceName: "redPaw-1"), type: .attack, borderColor: UIColor.BloodPawRed, price: 10), Enchantment(name: "Fruit Of Life", successRate: 60, stats: 6, image: #imageLiteral(resourceName: "greenFruit"), type: .health, borderColor: UIColor.GreenFruitGreen, price: 10)]
    
    //MARK: OUTLETS
    var enchantTableView = UITableView()
    
    
    private func setUpNavBar() {
        self.title = "Enchant"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpTableView()
        enchantTableView.reloadData()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        
    }

    func setUpTableView() {
        guard let monster = monster else {return}
        enchantTableView.backgroundColor = UIColor.white
        enchantTableView.delegate = self
        enchantTableView.dataSource = self
        let enchantheaderFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 120)
        enchantTableView.tableHeaderView = EnchantHeaderView(frame: enchantheaderFrame, monster: monster)
        enchantTableView.register(EnchantCell.self, forCellReuseIdentifier: "EnchantCell")
        self.view.addSubview(enchantTableView)
        
        enchantTableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
    }

}

extension EnchantViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EnchantCell") as! EnchantCell
        cell.delegate = self
        cell.enchantment = enchantments[indexPath.row]
        if monster?.slot == 0 {
            cell.enchantButton.isUserInteractionEnabled = false
            cell.enchantButton.backgroundColor = UIColor.gray
        } else {
            cell.enchantButton.isUserInteractionEnabled = true
            cell.enchantButton.backgroundColor = UIColor.buttonGreen
        }
        return cell
    }
    
    private func performEnchantment() {
        //gets 0 - 9
        let randomNumber = arc4random_uniform(10)
        if randomNumber <= 5 {
            sendResult = true
        } else {
            sendResult = false
        }
    }
    
    
}

extension EnchantViewController: enchantmentDelegate {
    
    func enchantMonster(enchantment: Enchantment) {
        performEnchantment()
        let resultVC = ResultViewController()
        resultVC.monster = monster
        resultVC.result = sendResult
        resultVC.enchantment = enchantment
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    
}
