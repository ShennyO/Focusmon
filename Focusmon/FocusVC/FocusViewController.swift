//
//  FocusViewController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/16/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class FocusViewController: UIViewController {

    //MARK: VARIABLES
    var timeSlot = 5
    var selectedTime: Int = 0
    var timeSlotsCollectionView: UICollectionView?
    let flowLayout = UICollectionViewFlowLayout()
    
    
    //MARK: OUTLETS
    var mineImageView: UIImageView = {
        var imageView = UIImageView(image: #imageLiteral(resourceName: "Mining"))
        return imageView
    }()
    
    var startButton: UIButton = {
        var button = UIButton(type: .system)
        button.layer.cornerRadius = 25
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = UIColor.buttonGreen
        return button
    }()
    
    @objc private func toSessionVC() {
        if selectedTime == 0 {
            return
        }
        let sessionVC = SessionViewController()
        sessionVC.timeInSeconds = selectedTime * 60
        navigationController?.pushViewController(sessionVC, animated: true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setUpNavBar()
        setUpOutlets()
        setUpConstraints()
        self.startButton.addTarget(self, action: #selector(toSessionVC), for: .touchUpInside)
        self.title = "Focus"
        // Do any additional setup after loading the view.
    }
    
    private func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let p = NSMutableParagraphStyle()
        p.firstLineHeadIndent = 0
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.paragraphStyle: p]
    }
    
    private func setUpOutlets() {
        setUpCollectionView()
        self.view.addSubview(mineImageView)
        self.view.addSubview(startButton)
        
    }
    
    private func setUpConstraints() {
        
        let mineImageWidthHeight = UIScreen.main.bounds.width * 0.9
        
        mineImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(45)
            make.centerX.equalToSuperview()
            make.width.equalTo(mineImageWidthHeight)
            make.height.equalTo(mineImageWidthHeight)
        }
        
        startButton.snp.makeConstraints { (make) in
            make.top.equalTo(mineImageView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(225)
            make.height.equalTo(50)
        }
        
        timeSlotsCollectionView?.snp.makeConstraints({ (make) in
            make.top.equalTo(startButton.snp.bottom).offset(30)
            make.width.equalToSuperview()
            make.height.equalTo(70)
            make.centerX.equalToSuperview()
        })
        
    }

    private func setUpCollectionView() {
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15)
        flowLayout.minimumLineSpacing = 20
        let collectionViewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 120)
        timeSlotsCollectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        timeSlotsCollectionView?.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        timeSlotsCollectionView?.delegate = self
        timeSlotsCollectionView?.dataSource = self
        timeSlotsCollectionView?.register(TimeSlotCollectionCell.self, forCellWithReuseIdentifier: "timeSlotCell")
        timeSlotsCollectionView?.backgroundColor = UIColor.white
        timeSlotsCollectionView?.showsHorizontalScrollIndicator = false
        self.view.addSubview(timeSlotsCollectionView!)
        
    }
    


}

extension FocusViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeSlotCell", for: indexPath) as! TimeSlotCollectionCell
        cell.delegate = self
        let time = timeSlot * (indexPath.row + 1)
        cell.time = time
        cell.setUp(selectedTime: selectedTime)
        return cell
        
    }
    
    
}

extension FocusViewController: timeSlotDelegate {
    
    func sendTime(time: Int) {
        selectedTime = time
        timeSlotsCollectionView?.reloadData()
    }
    
    
}
