//
//  ArenaViewController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/29/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class ArenaViewController: UIViewController {

    //MARK: OUTLETS
    var arenaTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setUpNavBar()
        setUpTableView()
    }

    private func setUpNavBar() {
        self.title = "Arena"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setUpTableView() {
        
        arenaTableView.backgroundColor = UIColor.white
        arenaTableView.delegate = self
        arenaTableView.dataSource = self
        arenaTableView.register(ArenaCell.self, forCellReuseIdentifier: "ArenaCell")
        self.view.addSubview(arenaTableView)
        
        arenaTableView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
    }
    

}

extension ArenaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArenaCell") as! ArenaCell
        cell.setUp()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
