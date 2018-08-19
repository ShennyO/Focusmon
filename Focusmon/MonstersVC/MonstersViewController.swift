//
//  MonstersViewController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/21/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class MonstersViewController: UIViewController {
    
    

    //MARK: VARIABLES
    
    var monsters: [Monster] = []
    
    //MARK: OUTLETS
    var monsterCollectionView: UICollectionView?
    let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...10 {
            let randomNumber = Int(arc4random_uniform(13))
            let newMonster = Monsters.createNewMonster(randomInt: randomNumber)
            monsters.append(newMonster)
        }
        setUpNavBar()
        setUpCollectionView()
        // Do any additional setup after loading the view.
    }

    func setUpNavBar() {
        self.title = "Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setUpCollectionView() {
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = -4
        let collectionViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        monsterCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        monsterCollectionView?.contentInset = UIEdgeInsets(top: 15, left: 22, bottom: 0, right: 22)
        monsterCollectionView?.delegate = self
        monsterCollectionView?.dataSource = self
        monsterCollectionView?.register(MonsterCollectionCell.self, forCellWithReuseIdentifier: "MonsterCollectionCell")
        monsterCollectionView?.register(MonstersHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "MonsterHeaderView")
        monsterCollectionView?.backgroundColor = UIColor.white
        monsterCollectionView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(monsterCollectionView!)
        setConstraints()
        
    }
    
    private func setConstraints() {
        monsterCollectionView?.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    

}

extension MonstersViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let monsterVC = MonsterViewController()
        
        monsterVC.monster = self.monsters[indexPath.row]
        navigationController?.pushViewController(monsterVC, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 415)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MonsterHeaderView", for: indexPath) as! MonstersHeaderView
        headerView.delegate = self
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monsters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monsterCollectionView?.dequeueReusableCell(withReuseIdentifier: "MonsterCollectionCell", for: indexPath) as! MonsterCollectionCell
        
        cell.configureCell(monster: monsters[indexPath.row])
        return cell
    }


}

extension MonstersViewController: monsterHeaderDelegate {
    
    func sendMonster(monster: Monster) {
        let monsterVC = MonsterViewController()
        
        monsterVC.monster = monster
        navigationController?.pushViewController(monsterVC, animated: true)
    }
    
}
