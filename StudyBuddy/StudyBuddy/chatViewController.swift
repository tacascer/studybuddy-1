//
//  chatViewController.swift
//  StudyBuddy
//
//  Created by rachel on 5/4/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class chatViewController: UIViewController {

    // THIS IS A DEMO OF HOW OUR "THREAD" OR "CHAT" WOULD LOOK LIKE:
    
    var group: Groups!
    var row: Int!
    var question: UILabel!
    var replies: UILabel!
    var replyPost: UILabel!
    var replyDate: UILabel!
    var replyDate2: UILabel!
    var askQuestion: UILabel!
    var datePostLabel: UILabel!
    var askQuestionText: UITextField!
    var person: UILabel!
    var person1: UILabel!
    var person2: UILabel!
    var person3: UILabel!
    var postQuestion: UILabel!
    var question2: UILabel!
    var replies2: UILabel!
    var replyPost2: UILabel!
    
    var askQuestion2: UILabel!
    var datePostLabel2: UILabel!
    
    let green = UIColor(red: 182/255, green: 201/255, blue: 172/255, alpha: 1)
    let purple = UIColor(red: 164/255, green: 162/255, blue: 212/255, alpha: 1)
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Thread :)"
        
        question = UILabel()
        question.translatesAutoresizingMaskIntoConstraints = false
        question.text = "Question:"
        question.textColor = pink
        question.font = UIFont(name: "Futura-bold", size: 20)
        question.textAlignment = .left
        view.addSubview(question)
        
        postQuestion = UILabel()
        postQuestion.translatesAutoresizingMaskIntoConstraints = false
        postQuestion.text = "Post a question!:"
        postQuestion.textColor = blue
        postQuestion.font = UIFont(name: "Futura-bold", size: 15)
        postQuestion.textAlignment = .left
        view.addSubview(postQuestion)
        
        askQuestionText = UITextField()
        askQuestionText.translatesAutoresizingMaskIntoConstraints = false
        askQuestionText.borderStyle = .roundedRect
        askQuestionText.backgroundColor = pink
        view.addSubview(askQuestionText)
        
        
        question2 = UILabel()
        question2.translatesAutoresizingMaskIntoConstraints = false
        question2.text = "Question:"
        question2.textColor = pink
        question2.font = UIFont(name: "Futura-bold", size: 20)
        question2.textAlignment = .left
        view.addSubview(question2)
        
        replies = UILabel()
        replies.translatesAutoresizingMaskIntoConstraints = false
        replies.text = "Replies:"
        replies.textColor = pink
        replies.font = UIFont(name: "Futura-bold", size: 15)
        replies.textAlignment = .left
        view.addSubview(replies)
        
        replies2 = UILabel()
        replies2.translatesAutoresizingMaskIntoConstraints = false
        replies2.text = "Replies:"
        replies2.textColor = pink
        replies2.font = UIFont(name: "Futura-bold", size: 15)
        replies2.textAlignment = .left
        view.addSubview(replies2)
        
        datePostLabel = UILabel()
        datePostLabel.translatesAutoresizingMaskIntoConstraints = false
        datePostLabel.text = "Posted: 05/02/19 11:30PM"
        datePostLabel.textColor = .black
        datePostLabel.font = UIFont(name: "FuturaBT-Book", size: 10)
        datePostLabel.textAlignment = .right
        view.addSubview(datePostLabel)
        
        datePostLabel2 = UILabel()
        datePostLabel2.translatesAutoresizingMaskIntoConstraints = false
        datePostLabel2.text = "Posted: 05/04/19 9:00AM"
        datePostLabel2.textColor = .black
        datePostLabel2.font = UIFont(name: "FuturaBT-Book", size: 10)
        datePostLabel2.textAlignment = .right
        view.addSubview(datePostLabel2)
        
        replyDate = UILabel()
        replyDate.translatesAutoresizingMaskIntoConstraints = false
        replyDate.text = "Posted: 05/02/19 11:47PM"
        replyDate.textColor = .black
        replyDate.font = UIFont(name: "FuturaBT-Book", size: 10)
        replyDate.textAlignment = .right
        view.addSubview(replyDate)
        
        replyDate2 = UILabel()
        replyDate2.translatesAutoresizingMaskIntoConstraints = false
        replyDate2.text = "Posted: 05/04/19 12:20PM"
        replyDate2.textColor = .black
        replyDate2.font = UIFont(name: "FuturaBT-Book", size: 10)
        replyDate2.textAlignment = .right
        view.addSubview(replyDate2)
        
        
        person = UILabel()
        person.translatesAutoresizingMaskIntoConstraints = false
        person.text = "Rachel Kwon"
        person.textColor = .black
        person.font = UIFont(name: "Futura-mid", size: 10)
        person.textAlignment = .left
        view.addSubview(person)
        
        person1 = UILabel()
        person1.translatesAutoresizingMaskIntoConstraints = false
        person1.text = "Celina Kim"
        person1.textColor = .black
        person1.font = UIFont(name: "Futura-mid", size: 10)
        person1.textAlignment = .left
        view.addSubview(person1)
        
        person2 = UILabel()
        person2.translatesAutoresizingMaskIntoConstraints = false
        person2.text = "Kevin Im"
        person2.textColor = .black
        person2.font = UIFont(name: "Futura-mid", size: 10)
        person2.textAlignment = .left
        view.addSubview(person2)
        
        person3 = UILabel()
        person3.translatesAutoresizingMaskIntoConstraints = false
        person3.text = "Shaney Hwang"
        person3.textColor = .black
        person3.font = UIFont(name: "Futura-mid", size: 10)
        person3.textAlignment = .left
        view.addSubview(person3)
        
        
        askQuestion = UILabel()
        askQuestion.translatesAutoresizingMaskIntoConstraints = false
        askQuestion.text = "Are you guys meeting at RPCC today?"
        askQuestion.textColor = white
        askQuestion.font = UIFont(name: "FuturaBT-Book", size: 20)
        askQuestion.textAlignment = .center
        askQuestion.backgroundColor = blue
        askQuestion.layer.cornerRadius = 5
        askQuestion.layer.borderWidth = 1
        askQuestion.layer.masksToBounds = true
        askQuestion.layer.borderColor = UIColor.clear.cgColor
        //UIColor.white.cgColor
        view.addSubview(askQuestion)
        
        askQuestion2 = UILabel()
        askQuestion2.translatesAutoresizingMaskIntoConstraints = false
        askQuestion2.text = "Who's studying today?"
        askQuestion2.textColor = white
        askQuestion2.font = UIFont(name: "FuturaBT-Book", size: 20)
        askQuestion2.textAlignment = .center
        askQuestion2.backgroundColor = blue
        askQuestion2.layer.cornerRadius = 5
        askQuestion2.layer.borderWidth = 1
        askQuestion2.layer.masksToBounds = true
        askQuestion2.layer.borderColor = UIColor.clear.cgColor
        //UIColor.white.cgColor
        view.addSubview(askQuestion2)
        
        replyPost = UILabel()
        replyPost.translatesAutoresizingMaskIntoConstraints = false
        replyPost.text = "Yeah! I'm going to be in room 230"
        replyPost.textColor = white
        replyPost.font = UIFont(name: "FuturaBT-Book", size: 15)
        replyPost.textAlignment = .center
        replyPost.backgroundColor = purple
        replyPost.layer.cornerRadius = 5
        replyPost.layer.borderWidth = 1
        replyPost.layer.masksToBounds = true
        replyPost.layer.borderColor = UIColor.clear.cgColor
        //UIColor.white.cgColor
        view.addSubview(replyPost)
        
        replyPost2 = UILabel()
        replyPost2.translatesAutoresizingMaskIntoConstraints = false
        replyPost2.text = "Not me :( I'm sick"
        replyPost2.textColor = white
        replyPost2.font = UIFont(name: "FuturaBT-Book", size: 15)
        replyPost2.textAlignment = .center
        replyPost2.backgroundColor = purple
        replyPost2.layer.cornerRadius = 5
        replyPost2.layer.borderWidth = 1
        replyPost2.layer.masksToBounds = true
        replyPost2.layer.borderColor = UIColor.clear.cgColor
        //UIColor.white.cgColor
        view.addSubview(replyPost2)
        
        setupConstraints()
        setupNavigationBarItems()
        
    }
    private func setupNavigationBarItems(){
        let joinButton = UIButton(type: .custom)
        
        joinButton.backgroundColor = .white
        joinButton.setTitle("+ Join Group", for: .normal)
        joinButton.setTitleColor(purple, for: .normal)
        joinButton.titleLabel?.font = UIFont(name: "Futura-mid", size: 15)
        joinButton.layer.cornerRadius = 10
        joinButton.layer.borderWidth = 1
        joinButton.layer.borderColor = UIColor.white.cgColor
        // joinButton.addTarget(self, action: #selector(pushto), for: .touchUpInside)
        let button2 = UIBarButtonItem(customView: joinButton)
        self.navigationItem.setRightBarButton(button2, animated: true)
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            question.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            question.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question.widthAnchor.constraint(equalToConstant: 300),
            question.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            question2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 340),
            question2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            question2.widthAnchor.constraint(equalToConstant: 300),
            question2.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            postQuestion.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 670),
            postQuestion.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            postQuestion.widthAnchor.constraint(equalToConstant: 300),
            postQuestion.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            askQuestionText.topAnchor.constraint(equalTo: postQuestion.bottomAnchor),
            askQuestionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            askQuestionText.widthAnchor.constraint(equalToConstant: 370),
            askQuestionText.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            person.topAnchor.constraint(equalTo: question.bottomAnchor, constant: 5),
            person.leadingAnchor.constraint(equalTo: question.leadingAnchor),
            person.widthAnchor.constraint(equalToConstant: 100),
            person.heightAnchor.constraint(equalToConstant: 17)
            ])
        
        NSLayoutConstraint.activate([
            person2.topAnchor.constraint(equalTo: question2.bottomAnchor, constant: 5),
            person2.leadingAnchor.constraint(equalTo: question2.leadingAnchor),
            person2.widthAnchor.constraint(equalToConstant: 100),
            person2.heightAnchor.constraint(equalToConstant: 17)
            ])
        
        NSLayoutConstraint.activate([
            askQuestion.topAnchor.constraint(equalTo: person.bottomAnchor, constant: 2),
            askQuestion.leadingAnchor.constraint(equalTo: question.leadingAnchor),
            askQuestion.widthAnchor.constraint(equalToConstant: 370),
            askQuestion.heightAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            askQuestion2.topAnchor.constraint(equalTo: person2.bottomAnchor, constant: 2),
            askQuestion2.leadingAnchor.constraint(equalTo: question2.leadingAnchor),
            askQuestion2.widthAnchor.constraint(equalToConstant: 370),
            askQuestion2.heightAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate ([
            datePostLabel.topAnchor.constraint(equalTo: askQuestion.bottomAnchor, constant: 1),
            datePostLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            datePostLabel.widthAnchor.constraint(equalToConstant: 300),
            datePostLabel.heightAnchor.constraint(equalToConstant: 10)
            ])
        
        NSLayoutConstraint.activate ([
            datePostLabel2.topAnchor.constraint(equalTo: askQuestion2.bottomAnchor, constant: 1),datePostLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),datePostLabel2.widthAnchor.constraint(equalToConstant: 300),datePostLabel2.heightAnchor.constraint(equalToConstant: 10)])
        
        NSLayoutConstraint.activate ([
            replies.topAnchor.constraint(equalTo: askQuestion.bottomAnchor, constant: 5),
            replies.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            replies.widthAnchor.constraint(equalToConstant: 300),
            replies.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate ([
            replies2.topAnchor.constraint(equalTo: askQuestion2.bottomAnchor, constant: 5),replies2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),replies2.widthAnchor.constraint(equalToConstant: 300),replies2.heightAnchor.constraint(equalToConstant: 30)])
        
        NSLayoutConstraint.activate ([
            person1.topAnchor.constraint(equalTo: replies.bottomAnchor, constant: 5),
            person1.leadingAnchor.constraint(equalTo: replies.leadingAnchor),
            person1.widthAnchor.constraint(equalToConstant: 100),
            person1.heightAnchor.constraint(equalToConstant: 17)
            ])
        
        NSLayoutConstraint.activate ([
            person3.topAnchor.constraint(equalTo: replies2.bottomAnchor, constant: 5),person3.leadingAnchor.constraint(equalTo: replies2.leadingAnchor),person3.widthAnchor.constraint(equalToConstant: 300),person3.heightAnchor.constraint(equalToConstant: 17)])
        
        
        
        NSLayoutConstraint.activate ([
            replyPost.topAnchor.constraint(equalTo: person1.bottomAnchor, constant: 5),
            replyPost.leadingAnchor.constraint(equalTo: replies.leadingAnchor),
            replyPost.widthAnchor.constraint(equalToConstant: 300),
            replyPost.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate ([
            replyPost2.topAnchor.constraint(equalTo: person3.bottomAnchor, constant: 5),replyPost2.leadingAnchor.constraint(equalTo: replies2.leadingAnchor),replyPost2.widthAnchor.constraint(equalToConstant: 300),replyPost2.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate ([
            replyDate.topAnchor.constraint(equalTo: replyPost.bottomAnchor, constant: 1),
            replyDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            replyDate.widthAnchor.constraint(equalToConstant: 300),
            replyDate.heightAnchor.constraint(equalToConstant: 10)
            ])
        
        NSLayoutConstraint.activate ([
            replyDate2.topAnchor.constraint(equalTo: replyPost2.bottomAnchor, constant: 1),
            replyDate2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            replyDate2.widthAnchor.constraint(equalToConstant: 300),
            replyDate2.heightAnchor.constraint(equalToConstant: 10)
            ])
    }

}
