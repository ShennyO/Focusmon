//
//  SessionViewController.swift
//  Focusmon
//
//  Created by Sunny Ouyang on 8/4/18.
//  Copyright © 2018 Sunny Ouyang. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController {
    
    //MARK: VARIABLES
    var startTime: TimeInterval = Date.timeIntervalSinceReferenceDate
    var currentTime: TimeInterval!
    var endTime: TimeInterval!

    
    var timeInSeconds: Int = 0

    //MARK: OUTLETS
    var timeLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 65, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.newBlack
        return label
    }()
    
    var sessionImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "GemCart")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var cancelButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        button.setTitle("Quit", for: .normal)
        button.backgroundColor = UIColor.attackRed
        return button
    }()
    
    
    //MARK: OUTLETS END
    
    //MARK: TIMER
    var timer = Timer()
    
    
    func runTimer() {
        currentTime = Date.timeIntervalSinceReferenceDate
        let elapsedTimeDouble = endTime - currentTime
        let elapsedtimeInt = Int(elapsedTimeDouble)
        timeLabel.text = "\(timeString(time: elapsedtimeInt))" //This will update the label.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        currentTime = Date.timeIntervalSinceReferenceDate
        let elapsedTimeDouble = endTime - currentTime
        let elapsedtimeInt = Int(elapsedTimeDouble)
        timeLabel.text = "\(timeString(time: elapsedtimeInt))" //This will update the label.
    }
    
    func timeString(time:Int) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        if hours < 1 {
            return String(format:"%02i:%02i", minutes, seconds)
        }
        return String(format:"%2i:%02i:%02i", hours, minutes, seconds)
    }
    
    //MARK: TIMER END
    
    
    private func setConstraints() {
        timeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(135)
        }
        
        sessionImageView.snp.makeConstraints { (make) in
            make.height.equalTo(300)
            make.width.equalTo(300)
            make.top.equalTo(timeLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.top.equalTo(sessionImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(225)
            make.height.equalTo(50)
        }
    }
    
    private func addOutlets() {
        [timeLabel, sessionImageView, cancelButton].forEach { (view) in
            self.view.addSubview(view)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.view.backgroundColor = UIColor.white
        endTime = Date.timeIntervalSinceReferenceDate + Double(timeInSeconds)
        timeLabel.text = "\(timeString(time: timeInSeconds))"
        runTimer()
        setUpNavBar()
        addOutlets()
        setConstraints()
        cancelButton.addTarget(self, action: #selector(unwindFromSession), for: .touchUpInside)
        
        
        
        // Do any additional setup after loading the view.
    }

    private func setUpNavBar() {
        self.title = "Session"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func unwindFromSession() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SessionViewController {
    //I can possibly hold a reference to the start time in User Defaults everytime a user starts a new session
    //I can also save the projected end time: startTime + whatever the time was
    //When the user is in the app, I'll just grab the remaining time from projected end time (double) - the current time
    
    
    
    
    
}
