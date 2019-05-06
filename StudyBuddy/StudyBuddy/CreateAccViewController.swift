//
//  CreateAccViewController.swift
//  StudyBuddy
//
//  Created by rachel on 5/4/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class CreateAccViewController: UIViewController {

    var name: UILabel!
    var nameExample: UILabel!
    var myName: UITextField!
    var netid: UILabel!
    var netidExample: UILabel!
    var myNetid: UITextField!
    var password: UILabel!
    var passwordText: UILabel!
    var myPassword: UITextField!
    var create: UIButton!
    
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Create new account"
        
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Your Name"
        name.textColor = .black
        name.font = UIFont(name: "FuturaBT-Book", size: 20)
        name.textAlignment = .left
        view.addSubview(name)
        
        nameExample = UILabel()
        nameExample.translatesAutoresizingMaskIntoConstraints = false
        nameExample.text = "ex: John Smith"
        nameExample.textColor = .black
        nameExample.font = UIFont(name: "FuturaBT-Book", size: 16)
        nameExample.textAlignment = .left
        view.addSubview(nameExample)
        
        myName = UITextField()
        myName.translatesAutoresizingMaskIntoConstraints = false
        myName.borderStyle = .roundedRect
        myName.backgroundColor = blue
        view.addSubview(myName)
        
        netid = UILabel()
        netid.translatesAutoresizingMaskIntoConstraints = false
        netid.text = "Your Cornell netid"
        netid.textColor = .black
        netid.font = UIFont(name: "FuturaBT-Book", size: 20)
        netid.textAlignment = .left
        view.addSubview(netid)
        
        netidExample = UILabel()
        netidExample.translatesAutoresizingMaskIntoConstraints = false
        netidExample.text = "ex: ab267 "
        netidExample.textColor = .black
        netidExample.font = UIFont(name: "FuturaBT-Book", size: 16)
        netidExample.textAlignment = .left
        view.addSubview(netidExample)
        
        myNetid = UITextField()
        myNetid.translatesAutoresizingMaskIntoConstraints = false
        myNetid.borderStyle = .roundedRect
        myNetid.backgroundColor = blue
        view.addSubview(myNetid)
        
        password = UILabel()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.text = "Your Password"
        password.textColor = .black
        password.font = UIFont(name: "FuturaBT-Book", size: 20)
        password.textAlignment = .left
        view.addSubview(password)
        
        passwordText = UILabel()
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.text = "Try to make it unique!"
        passwordText.textColor = .black
        passwordText.font = UIFont(name: "FuturaBT-Book", size: 20)
        passwordText.textAlignment = .left
        view.addSubview(passwordText)
        
        myPassword = UITextField()
        myPassword.translatesAutoresizingMaskIntoConstraints = false
        myPassword.borderStyle = .roundedRect
        myPassword.backgroundColor = blue
        view.addSubview(myPassword)
        
        create = UIButton()
        create.translatesAutoresizingMaskIntoConstraints = false
        create.backgroundColor = pink
        create.setTitle("Create", for: .normal)
        create.setTitleColor(.white, for: .normal)
        create.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 20)
        create.layer.cornerRadius = 8
        create.layer.borderWidth = 1
        create.layer.borderColor = UIColor.white.cgColor
        create.addTarget(self, action: #selector(createUsers), for: .touchUpInside)
        view.addSubview(create)
        
        setupConstraints()
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25), name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25), name.widthAnchor.constraint(equalToConstant: 300), name.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            nameExample.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8), nameExample.leadingAnchor.constraint(equalTo: name.leadingAnchor), nameExample.widthAnchor.constraint(equalToConstant: 300), nameExample.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            myName.topAnchor.constraint(equalTo: nameExample.bottomAnchor, constant: 5), myName.leadingAnchor.constraint(equalTo: name.leadingAnchor), myName.widthAnchor.constraint(equalToConstant: 300), myName.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            netid.topAnchor.constraint(equalTo: myName.bottomAnchor, constant: 40), netid.leadingAnchor.constraint(equalTo: myName.leadingAnchor), netid.widthAnchor.constraint(equalToConstant: 400), netid.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            netidExample.topAnchor.constraint(equalTo: netid.bottomAnchor, constant: 8), netidExample.leadingAnchor.constraint(equalTo: myName.leadingAnchor), netidExample.widthAnchor.constraint(equalToConstant: 300), netidExample.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            myNetid.topAnchor.constraint(equalTo: netidExample.bottomAnchor, constant: 8), myNetid.leadingAnchor.constraint(equalTo: myName.leadingAnchor), myNetid.widthAnchor.constraint(equalToConstant: 300), myNetid.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: myNetid.bottomAnchor, constant: 40),  password.leadingAnchor.constraint(equalTo: myName.leadingAnchor),  password.widthAnchor.constraint(equalToConstant: 400), netid.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            passwordText.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 8), passwordText.leadingAnchor.constraint(equalTo: myName.leadingAnchor), passwordText.widthAnchor.constraint(equalToConstant: 400), passwordText.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            myPassword.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 8), myPassword.leadingAnchor.constraint(equalTo: myName.leadingAnchor), myPassword.widthAnchor.constraint(equalToConstant: 300), myPassword.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        
        NSLayoutConstraint.activate([
            create.topAnchor.constraint(equalTo: myPassword.bottomAnchor, constant: 40), create.leadingAnchor.constraint(equalTo: myName.leadingAnchor, constant: 133), create.widthAnchor.constraint(equalToConstant: 100), create.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    
    @objc func createUsers() {
        NetworkManager.createUser(name: myName.text ?? "", netid: myNetid.text ?? "" , password: myPassword.text ?? "") {success in
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
