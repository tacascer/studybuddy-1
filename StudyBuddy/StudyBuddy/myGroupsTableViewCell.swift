//
//  myGroupsTableViewCell.swift
//  StudyBuddy
//
//  Created by rachel on 4/26/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class myGroupsTableViewCell: UITableViewCell {

    var courseNameLabel: UILabel!
    var topicLabel: UILabel!
    var timesLabel: UILabel!
    var barLabel: UILabel!
    var locationLabel: UILabel!
    var chatButton: UIImageView!
    
    
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let purple = UIColor(red: 164/255, green: 162/255, blue: 212/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        courseNameLabel = UILabel()
        courseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        courseNameLabel.font = UIFont(name: "FuturaBT-Book", size: 18)
        courseNameLabel.textColor = .white
        courseNameLabel.textAlignment = .left
        contentView.addSubview(courseNameLabel)
        
        topicLabel = UILabel()
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        topicLabel.font = UIFont(name: "FuturaBT-Book", size: 16)
        topicLabel.textColor = .white
        topicLabel.textAlignment = .left
        contentView.addSubview(topicLabel)
        
        timesLabel = UILabel()
        timesLabel.translatesAutoresizingMaskIntoConstraints = false
        timesLabel.font = UIFont(name: "FuturaBT-Book", size: 14)
        timesLabel.textColor = .white
        contentView.addSubview(timesLabel)
        
        barLabel = UILabel()
        barLabel.translatesAutoresizingMaskIntoConstraints = false
        barLabel.text = "|"
        barLabel.textColor = .white
        barLabel.font = UIFont(name: "FuturaBT-Book", size: 16)
        barLabel.textAlignment = .center
        contentView.addSubview(barLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont(name: "FuturaBT-Book", size:14)
        locationLabel.textColor = .white
        contentView.addSubview(locationLabel)
        
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            courseNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15), courseNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15), courseNameLabel.widthAnchor.constraint(equalToConstant: 200), courseNameLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            topicLabel.leadingAnchor.constraint(equalTo: barLabel.trailingAnchor, constant: 10), topicLabel.topAnchor.constraint(equalTo: courseNameLabel.topAnchor), topicLabel.widthAnchor.constraint(equalToConstant: 100), topicLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            timesLabel.leadingAnchor.constraint(equalTo: courseNameLabel.leadingAnchor), timesLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 10), timesLabel.widthAnchor.constraint(equalToConstant: 200), timesLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            barLabel.topAnchor.constraint(equalTo: courseNameLabel.topAnchor), barLabel.leadingAnchor.constraint(equalTo: courseNameLabel.trailingAnchor, constant: 8), barLabel.widthAnchor.constraint(equalToConstant: 15), barLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: courseNameLabel.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: timesLabel.bottomAnchor, constant: 5),
            locationLabel.widthAnchor.constraint(equalToConstant: 200),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
    
    func configure(for groups: Groups) {
        courseNameLabel.text = groups.class_name
        topicLabel.text = groups.description
        timesLabel.text = groups.time
        locationLabel.text = groups.location
    }

}
