//
//  TimeSlotCollectionCell.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 7/16/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit
import SnapKit

protocol timeSlotDelegate {
    func sendTime(time: Int)
}

class TimeSlotCollectionCell: UICollectionViewCell {
    
    //MARK: VARIABLES
    var time: Int?
    var buttonTag: Int?
    var delegate: timeSlotDelegate?
    
    //MARK: OUTLETS
    
    var buttonContainer: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 11
        view.backgroundColor = UIColor.timeBlue
        return view
    }()
    
    var timeButton: UIButton = {
        var button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 21)
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        button.backgroundColor = UIColor.clear
        
        return button
    }()
    
    @objc func timeButtonTapped() {
        delegate?.sendTime(time: time!)
    }
    
    func setUpConstraints() {
        
        timeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(15)
        }
        
        buttonContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
    }
    
    
    
    func setUp(selectedTime: Int) {
        timeButton.addTarget(self, action: #selector(timeButtonTapped), for: .touchUpInside)
        let timeString = "\(time!) min"
        if time == selectedTime {
            self.buttonContainer.backgroundColor = UIColor.selectedYellow
        } else {
            self.buttonContainer.backgroundColor = UIColor.timeBlue
        }
        self.backgroundColor = UIColor.backgroundWhite
        timeButton.setTitle(timeString, for: .normal)
        self.addSubview(buttonContainer)
        buttonContainer.addSubview(timeButton)
        setUpConstraints()
    }
    
}
