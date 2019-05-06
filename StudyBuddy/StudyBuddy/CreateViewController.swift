//
//  CreateViewController.swift
//  StudyBuddy
//
//  Created by rachel on 4/25/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    var course: UILabel!
    var courseExample: UILabel!
    var courseName: UITextField!
    var location: UILabel!
    var locationExample: UILabel!
    var locationInput: UITextField!
    var times: UILabel!
    var timesExample: UILabel!
    var timesInput: UITextField!
    var people: UILabel!
    var peopleInput: UITextField!
    var topic: UILabel!
    var topicExample: UILabel!
    var topicInput: UITextField!
    var submitButton: UIButton!

    
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let purple = UIColor(red: 164/255, green: 162/255, blue: 212/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Create Group"
        
        course = UILabel()
        course.translatesAutoresizingMaskIntoConstraints = false
        course.text = "Course Name"
        course.textColor = .black
        course.font = UIFont(name: "FuturaBT-Book", size: 20)
        course.textAlignment = .left
        view.addSubview(course)
        
        courseExample = UILabel()
        courseExample.translatesAutoresizingMaskIntoConstraints = false
        courseExample.text = "ex: CS1110, BIOMG 1350"
        courseExample.textColor = .black
        courseExample.font = UIFont(name: "FuturaBT-Book", size: 16)
        courseExample.textAlignment = .left
        view.addSubview(courseExample)
        
        courseName = UITextField()
        courseName.translatesAutoresizingMaskIntoConstraints = false
        courseName.borderStyle = .roundedRect
        courseName.backgroundColor = pink
        view.addSubview(courseName)
        
        location = UILabel()
        location.translatesAutoresizingMaskIntoConstraints = false
        location.text = "Location"
        location.textColor = .black
        location.font = UIFont(name: "FuturaBT-Book", size: 20)
        location.textAlignment = .left
        view.addSubview(location)
        
        locationExample = UILabel()
        locationExample.translatesAutoresizingMaskIntoConstraints = false
        locationExample.text = "ex: North Campus, West Campus, etc."
        locationExample.textColor = .black
        locationExample.font = UIFont(name: "FuturaBT-Book", size: 16)
        locationExample.textAlignment = .left
        view.addSubview(locationExample)
        
        locationInput = UITextField()
        locationInput.translatesAutoresizingMaskIntoConstraints = false
        locationInput.borderStyle = .roundedRect
        locationInput.backgroundColor = pink
        view.addSubview(locationInput)
        
        times = UILabel()
        times.translatesAutoresizingMaskIntoConstraints = false
        times.text = "Availability"
        times.textColor = .black
        times.font = UIFont(name: "FuturaBT-Book", size: 20)
        times.textAlignment = .left
        view.addSubview(times)
        
        timesExample = UILabel()
        timesExample.translatesAutoresizingMaskIntoConstraints = false
        timesExample.text = "ex: Monday, Tuesday, Wednesday, etc."
        timesExample.textColor = .black
        timesExample.font = UIFont(name: "FuturaBT-Book", size: 16)
        timesExample.textAlignment = .left
        view.addSubview(timesExample)
        
        timesInput = UITextField()
        timesInput.translatesAutoresizingMaskIntoConstraints = false
        timesInput.borderStyle = .roundedRect
        timesInput.backgroundColor = pink
        view.addSubview(timesInput)
        
        people = UILabel()
        people.translatesAutoresizingMaskIntoConstraints = false
        people.text = "Number of people in your group"
        people.textColor = .black
        people.textAlignment = .left
        people.font = UIFont(name: "FuturaBT-Book", size: 20)
        view.addSubview(people)

        peopleInput = UITextField()
        peopleInput.translatesAutoresizingMaskIntoConstraints = false
        peopleInput.borderStyle = .roundedRect
        peopleInput.backgroundColor = pink
        view.addSubview(peopleInput)
        
        topic = UILabel()
        topic.translatesAutoresizingMaskIntoConstraints = false
        topic.text = "What are you studying for?"
        topic.textColor = .black
        topic.textAlignment = .left
        topic.font = UIFont(name: "FuturaBT-Book", size: 20)
        view.addSubview(topic)
        
        topicExample = UILabel()
        topicExample.translatesAutoresizingMaskIntoConstraints = false
        topicExample.text = "ex: Prelim, Final, Assignment"
        topicExample.textColor = .black
        topicExample.font = UIFont(name: "FuturaBT-Book", size: 16)
        topicExample.textAlignment = .left
        view.addSubview(topicExample)
        
        topicInput = UITextField()
        topicInput.translatesAutoresizingMaskIntoConstraints = false
        topicInput.borderStyle = .roundedRect
        topicInput.backgroundColor = pink
        view.addSubview(topicInput)
        
        submitButton = UIButton()
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.backgroundColor = blue
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = UIFont(name: "FuturaBT-Book", size: 20)
        submitButton.layer.cornerRadius = 8
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor.white.cgColor
        submitButton.addTarget(self, action: #selector(createGroups), for: .touchUpInside)
        view.addSubview(submitButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            course.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35), course.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25), course.widthAnchor.constraint(equalToConstant: 300), course.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            courseExample.topAnchor.constraint(equalTo: course.bottomAnchor, constant: 8), courseExample.leadingAnchor.constraint(equalTo: course.leadingAnchor), courseExample.widthAnchor.constraint(equalToConstant: 300), courseExample.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            courseName.topAnchor.constraint(equalTo: courseExample.bottomAnchor, constant: 5), courseName.leadingAnchor.constraint(equalTo: course.leadingAnchor), courseName.widthAnchor.constraint(equalToConstant: 300), courseName.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: courseName.bottomAnchor, constant: 40), location.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), location.widthAnchor.constraint(equalToConstant: 100), location.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            locationExample.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 8), locationExample.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), locationExample.widthAnchor.constraint(equalToConstant: 300), locationExample.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            locationInput.topAnchor.constraint(equalTo: locationExample.bottomAnchor, constant: 8), locationInput.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), locationInput.widthAnchor.constraint(equalToConstant: 300), locationInput.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            times.topAnchor.constraint(equalTo: locationInput.bottomAnchor, constant: 40), times.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), times.widthAnchor.constraint(equalToConstant: 100), times.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            timesExample.topAnchor.constraint(equalTo: times.bottomAnchor, constant: 8), timesExample.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), timesExample.widthAnchor.constraint(equalToConstant: 300), timesExample.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            timesInput.topAnchor.constraint(equalTo: timesExample.bottomAnchor, constant: 8), timesInput.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), timesInput.widthAnchor.constraint(equalToConstant: 300), timesInput.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            people.topAnchor.constraint(equalTo: timesInput.bottomAnchor, constant: 40), people.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), people.widthAnchor.constraint(equalToConstant: 400), people.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            peopleInput.topAnchor.constraint(equalTo: people.bottomAnchor, constant: 8), peopleInput.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), peopleInput.widthAnchor.constraint(equalToConstant: 300), peopleInput.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            topic.topAnchor.constraint(equalTo: peopleInput.bottomAnchor, constant: 40), topic.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), topic.widthAnchor.constraint(equalToConstant: 300), topic.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            topicExample.topAnchor.constraint(equalTo: topic.bottomAnchor, constant: 8), topicExample.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), topicExample.widthAnchor.constraint(equalToConstant: 300), topicExample.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            topicInput.topAnchor.constraint(equalTo: topicExample.bottomAnchor, constant: 8), topicInput.leadingAnchor.constraint(equalTo: courseName.leadingAnchor), topicInput.widthAnchor.constraint(equalToConstant: 300), topicInput.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: topicInput.bottomAnchor, constant: 40), submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150), submitButton.widthAnchor.constraint(equalToConstant: 100), submitButton.heightAnchor.constraint(equalToConstant: 50)
            ])
       
    }
    
    @objc func createGroups() {
        NetworkManager.createGroup(class_name: courseName.text ?? "", description: topicInput.text ?? "" , location: locationInput.text ?? "", time: timesInput.text ?? "") {success in
            if success {
                self.pushToGroupPage()
            } else {}
        }
        
       // NetworkManager.addUserToGroup(user: Users, group: Groupsuser: <#Users#>) { success in
         //   if success {
          //      self.pushToGroupPage()
         //   } else {}
        //}
    }
    
    @objc func pushToGroupPage() {
        let myGroupsView = myGroupsViewController()
        navigationController?.pushViewController(myGroupsView, animated: true)
        }
}
