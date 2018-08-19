//
//  MainTabBarController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/16/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //create tab one
        let focusVC = FocusViewController()
        let focusNavVC = UINavigationController(rootViewController: focusVC)
        let tabOneBarItem = UITabBarItem(title: "Focus", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        focusNavVC.tabBarItem = tabOneBarItem
        
        //create tab two
        let HatchVC = HatchViewController()
        let hatchNavVC = UINavigationController(rootViewController: HatchVC)
        let tabTwoBarItem = UITabBarItem(title: "Hatch", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        hatchNavVC.tabBarItem = tabTwoBarItem
        
        //create tab three
        let monsterVC = MonstersViewController()
        let monsterNavVC = UINavigationController(rootViewController: monsterVC)
        let tabThreeBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        monsterNavVC.tabBarItem = tabThreeBarItem
        
        //create tab four
        let arenaVC = ArenaViewController()
        let arenaNavVC = UINavigationController(rootViewController: arenaVC)
        let tabFourBarItem = UITabBarItem(title: "Arena", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        arenaNavVC.tabBarItem = tabFourBarItem
        
        self.viewControllers = [hatchNavVC, focusNavVC, monsterNavVC, arenaNavVC]
        
    }


}
