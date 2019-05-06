//
//  ViewController.swift
//  StudyBuddy
//
//  Created by rachel on 4/25/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var homeImage: UIImageView!
    var loginButton: UIButton!
    var signUpButton: UIButton!
    
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let purple = UIColor(red: 164/255, green: 162/255, blue: 212/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    let green = UIColor(red: 182/255, green: 201/255, blue: 172/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "StudyBuddy"
        
        homeImage = UIImageView()
        homeImage.translatesAutoresizingMaskIntoConstraints = false
        homeImage.contentMode = .scaleAspectFit
        homeImage.image = UIImage(named: "studybuddylogo")
        view.addSubview(homeImage)
        
        loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = pink
        loginButton.setTitle("Login using existing account", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 18)
        loginButton.layer.cornerRadius = 8
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.addTarget(self, action: #selector(pushLogViewController), for: .touchUpInside)
        view.addSubview(loginButton)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.backgroundColor = purple
        signUpButton.setTitle("Create new account", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 18)
        signUpButton.layer.cornerRadius = 8
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.addTarget(self, action: #selector(pushCreateAccViewController), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40), homeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor), homeImage.widthAnchor.constraint(equalToConstant: 400), homeImage.heightAnchor.constraint(equalToConstant: 500)
            ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: 20), loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), loginButton.widthAnchor.constraint(equalToConstant: 250), loginButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20), signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), signUpButton.widthAnchor.constraint(equalToConstant: 250), signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func pushCreateAccViewController() {
        let CreateAccView = CreateAccViewController()
        navigationController?.pushViewController(CreateAccView, animated: true)
    }
    
    @objc func pushLogViewController() {
        let LoginView = LogViewController()
        navigationController?.pushViewController(LoginView, animated: true)
    }
    
}
