//
//  homeViewController.swift
//  StudyBuddy
//
//  Created by rachel on 4/26/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    var welcome: UILabel!
    var createGroupButton: UIButton!
    var joinGroupButton: UIButton!
    
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let purple = UIColor(red: 164/255, green: 162/255, blue: 212/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    let green = UIColor(red: 182/255, green: 201/255, blue: 172/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Start Studying"
        
        welcome = UILabel()
        welcome.translatesAutoresizingMaskIntoConstraints = false
        welcome.text = "Let's get studying!"
        welcome.textColor = .gray
        welcome.font = UIFont(name: "FuturaBT-Book", size: 45)
        welcome.textAlignment = .center
        view.addSubview(welcome)
        
        createGroupButton = UIButton()
        createGroupButton.translatesAutoresizingMaskIntoConstraints = false
        createGroupButton.backgroundColor = pink
        createGroupButton.setTitle("Create Group", for: .normal)
        createGroupButton.setTitleColor(.white, for: .normal)
        createGroupButton.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 30)
        createGroupButton.layer.cornerRadius = 8
        createGroupButton.layer.borderWidth = 1
        createGroupButton.layer.borderColor = UIColor.white.cgColor
        createGroupButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        view.addSubview(createGroupButton)
        
        joinGroupButton = UIButton()
        joinGroupButton.translatesAutoresizingMaskIntoConstraints = false
        joinGroupButton.backgroundColor = purple
        joinGroupButton.setTitle("Join Group", for: .normal)
        joinGroupButton.setTitleColor(.white, for: .normal)
        joinGroupButton.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 30)
        joinGroupButton.layer.cornerRadius = 8
        joinGroupButton.layer.borderWidth = 1
        joinGroupButton.layer.borderColor = UIColor.white.cgColor
        joinGroupButton.addTarget(self, action: #selector(pushNextNavViewController), for: .touchUpInside)
        view.addSubview(joinGroupButton)
        
        setupConstraints()
        setupNavigationBarItems()
    }
    
    private func setupNavigationBarItems(){
        let groupButton = UIButton(type: .custom)
        
        groupButton.backgroundColor = .white
        groupButton.setTitle("My Groups", for: .normal)
        groupButton.setTitleColor(purple, for: .normal)
        groupButton.titleLabel?.font = UIFont(name: "Futura-mid", size: 15)
        groupButton.layer.cornerRadius = 10
        groupButton.layer.borderWidth = 1
        groupButton.layer.borderColor = UIColor.white.cgColor
        groupButton.addTarget(self, action: #selector(pushMyGroupsViewController), for: .touchUpInside)
        let button1 = UIBarButtonItem(customView: groupButton)
        self.navigationItem.setRightBarButton(button1, animated: true)
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcome.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40), welcome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30), welcome.heightAnchor.constraint(equalToConstant: 60), welcome.widthAnchor.constraint(equalToConstant: 350)
            ])
        NSLayoutConstraint.activate([
            createGroupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createGroupButton.topAnchor.constraint(equalTo: welcome.bottomAnchor, constant: 70), createGroupButton.heightAnchor.constraint(equalToConstant: 200), createGroupButton.widthAnchor.constraint(equalToConstant: 350)])
        
        NSLayoutConstraint.activate([
            joinGroupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            joinGroupButton.topAnchor.constraint(equalTo: createGroupButton.bottomAnchor, constant: 60),joinGroupButton.heightAnchor.constraint(equalToConstant: 200), joinGroupButton.widthAnchor.constraint(equalToConstant: 350)])
    }
    
    @ objc func pushNavViewController() {
        let createViewController = CreateViewController()
        navigationController?.pushViewController(createViewController, animated: true)
    }
    
    @objc func pushNextNavViewController() {
        let joinViewController = JoinViewController()
        navigationController?.pushViewController(joinViewController, animated: true)
    }
    
    @objc func pushMyGroupsViewController(){
        let GroupView = myGroupsViewController()
        navigationController?.pushViewController(GroupView, animated: true)
    }
    
}
