//
//  GroupsTableViewCell.swift
//  StudyBuddy
//
//  Created by rachel on 4/26/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {
    
    var courseNameLabel: UILabel!
    var topicLabel: UILabel!
    var timesLabel: UILabel!
    var locationLabel: UILabel!
    //var joinButton: UIButton!
    //var infoButton: UIButton!
    
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let purple = UIColor(red: 164/255, green: 162/255, blue: 212/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        courseNameLabel = UILabel()
        courseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        courseNameLabel.font = UIFont(name: "FuturaBT-Book", size: 25)
        courseNameLabel.textColor = .white
        courseNameLabel.textAlignment = .center
        contentView.addSubview(courseNameLabel)
        
        topicLabel = UILabel()
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        topicLabel.font = UIFont(name: "FuturaBT-Book", size: 20)
        topicLabel.textColor = .white
        topicLabel.textAlignment = .center
        contentView.addSubview(topicLabel)
        
        timesLabel = UILabel()
        timesLabel.translatesAutoresizingMaskIntoConstraints = false
        timesLabel.font = UIFont(name: "FuturaBT-Book", size: 16)
        timesLabel.textColor = .white 
        contentView.addSubview(timesLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont(name: "FuturaBT-Book", size: 16)
        locationLabel.textColor = .white
        contentView.addSubview(locationLabel)
        
        //joinButton = UIButton()
        //joinButton.translatesAutoresizingMaskIntoConstraints = false
        //joinButton.backgroundColor = purple
        //joinButton.setTitle("Join", for: .normal)
       // joinButton.setTitleColor(.white, for: .normal)
       // joinButton.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 20)
       // joinButton.layer.cornerRadius = 8
        //joinButton.layer.borderWidth = 1
        //joinButton.layer.borderColor = UIColor.clear.cgColor
        //joinButton.addTarget(self, action: #selector(pushToGroupPage), for: .touchUpInside)
        //contentView.addSubview(joinButton)
        
       // infoButton = UIButton()
       // infoButton.translatesAutoresizingMaskIntoConstraints = false
       // infoButton.backgroundColor = purple
       // infoButton.setTitle("+ Info", for: .normal)
      //  infoButton.setTitleColor(.white, for: .normal)
      //  infoButton.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 20)
      //  infoButton.layer.cornerRadius = 8
      //  infoButton.layer.borderWidth = 1
     //   infoButton.layer.borderColor = UIColor.clear.cgColor
     //   contentView.addSubview(infoButton)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            courseNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), courseNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10), courseNameLabel.heightAnchor.constraint(equalToConstant: 30), courseNameLabel.widthAnchor.constraint(equalToConstant: 300)
            ])
        
        NSLayoutConstraint.activate([
            topicLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), topicLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 10), topicLabel.heightAnchor.constraint(equalToConstant: 30), topicLabel.widthAnchor.constraint(equalToConstant: 300)
            ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            locationLabel.heightAnchor.constraint(equalToConstant: 75), timesLabel.widthAnchor.constraint(equalToConstant: 400)
            ])
        
        
        NSLayoutConstraint.activate([
            timesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), timesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            timesLabel.heightAnchor.constraint(equalToConstant: 30), timesLabel.widthAnchor.constraint(equalToConstant: 400)
            ])
        
        //NSLayoutConstraint.activate([
         //   joinButton.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 20), joinButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 110), joinButton.widthAnchor.constraint(equalToConstant: 80), joinButton.heightAnchor.constraint(equalToConstant: 40)
         //   ])
        
      //  NSLayoutConstraint.activate([
       //     infoButton.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 20), infoButton.leadingAnchor.constraint(equalTo: joinButton.trailingAnchor, constant: 15), infoButton.widthAnchor.constraint(equalToConstant: 80), infoButton.heightAnchor.constraint(equalToConstant: 40)
       //     ])
    }
    
    func configure(for group: Groups) {
        courseNameLabel.text = group.class_name
        topicLabel.text = group.description
        timesLabel.text = group.time
        locationLabel.text = group.location
    }
}
