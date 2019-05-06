//
//  LogViewController.swift
//  StudyBuddy
//
//  Created by rachel on 5/4/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {

    var id: UILabel!
    var idInput: UITextField!
    var pass: UILabel!
    var passwordInput: UITextField!
    var login: UIButton!
    
    
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Login"
        
        id = UILabel()
        id.translatesAutoresizingMaskIntoConstraints = false
        id.text = "Netid:"
        id.textColor = .black
        id.font = UIFont(name: "FuturaBT-Book", size: 20)
        id.textAlignment = .left
        view.addSubview(id)
        
        idInput = UITextField()
        idInput.translatesAutoresizingMaskIntoConstraints = false
        idInput.borderStyle = .roundedRect
        idInput.backgroundColor = blue
        view.addSubview(idInput)
        
        pass = UILabel()
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.text = "Password:"
        pass.textColor = .black
        pass.font = UIFont(name: "FuturaBT-Book", size: 20)
        pass.textAlignment = .left
        view.addSubview(pass)
        
        passwordInput = UITextField()
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        passwordInput.borderStyle = .roundedRect
        passwordInput.backgroundColor = blue
        view.addSubview(passwordInput)
        
        login = UIButton()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = pink
        login.setTitle("Login", for: .normal)
        login.setTitleColor(.white, for: .normal)
        login.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 20)
        login.layer.cornerRadius = 8
        login.layer.borderWidth = 1
        login.layer.borderColor = UIColor.white.cgColor
        login.addTarget(self, action: #selector(loginUsers), for: .touchUpInside)
        view.addSubview(login)
        
        setupConstraints()
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            id.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 262), id.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), id.widthAnchor.constraint(equalToConstant: 100),
            id.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            idInput.topAnchor.constraint(equalTo: id.bottomAnchor, constant: 5),
            idInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            idInput.widthAnchor.constraint(equalToConstant: 300), idInput.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            pass.topAnchor.constraint(equalTo: idInput.bottomAnchor, constant: 25), pass.leadingAnchor.constraint(equalTo: id.leadingAnchor), pass.widthAnchor.constraint(equalToConstant: 100),
            pass.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            passwordInput.topAnchor.constraint(equalTo: pass.bottomAnchor, constant: 5), passwordInput.leadingAnchor.constraint(equalTo: idInput.leadingAnchor), passwordInput.widthAnchor.constraint(equalToConstant: 300), passwordInput.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            login.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 40),
            login.leadingAnchor.constraint(equalTo: idInput.leadingAnchor, constant: 100), login.widthAnchor.constraint(equalToConstant: 100), login.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    
    @objc func loginUsers() {
        NetworkManager.loginUser(netid: idInput.text ?? "" , password: passwordInput.text ?? "") {success in
            if success {
                self.pushNavViewController()
            } else {
                
            }
        }
    }
    
    @objc func pushNavViewController() {
        let homeView = homeViewController()
        navigationController?.pushViewController(homeView, animated: true)
    }
    
}
