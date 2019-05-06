//
//  JoinViewController.swift
//  StudyBuddy
//
//  Created by rachel on 4/26/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var groupTableView: UITableView!
    var groups: [Groups] = [Groups]()
    
    let pink = UIColor(red: 225/255, green: 174/255, blue: 187/255, alpha: 1)
    let white = UIColor(red: 255/255, green: 255/255, blue: 249/255, alpha: 1)
    let purple = UIColor(red: 164/255, green: 162/255, blue: 212/255, alpha: 1)
    let blue = UIColor(red: 152/255, green: 165/255, blue: 215/255, alpha: 1)
    
    let cellSpacingHeight: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Join Group"
        view.backgroundColor = .white
        
        groupTableView = UITableView()
        groupTableView.translatesAutoresizingMaskIntoConstraints = false
        groupTableView.register(GroupsTableViewCell.self, forCellReuseIdentifier: "groupsCellID")
        groupTableView.dataSource = self
        groupTableView.delegate = self
        view.addSubview(groupTableView)
        
        setupConstraints()
        setupNavigationBarItems()
        getGroups()

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
            groupTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), groupTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10), groupTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20), groupTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func getGroups() {
        NetworkManager.getGroups{groupsArray in
            self.groups = groupsArray
            DispatchQueue.main.async {
                self.groupTableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupsCellID" , for: indexPath) as! GroupsTableViewCell
        let group = groups[indexPath.section]
        cell.courseNameLabel.text = group.class_name
        cell.topicLabel.text = group.description
        cell.timesLabel.text = group.time
        cell.locationLabel.text = group.location
        if( indexPath.section % 2 == 0) {
            cell.backgroundColor = pink
        } else {
            cell.backgroundColor = blue
        }
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = groups[indexPath.row]
        //addUser()
        let chat = chatViewController()
        chat.row = indexPath.row
        chat.group = group
        self.navigationController?.pushViewController(chat, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func pushMyGroupsViewController(){
        let GroupView = myGroupsViewController()
        navigationController?.pushViewController(GroupView, animated: true)
    
}
    @objc func pushChatViewController(){
        let chatView = chatViewController()
        navigationController?.pushViewController(chatView, animated: true)
    }
    
    //func addUser() {
//NetworkManager.addUserToGroupuser: <#Users#>user: Users, group: Groups { success in
            //if success {
       //         self.pushChatViewController()
      //      } else {}
      //  }
    //}
//}
}
