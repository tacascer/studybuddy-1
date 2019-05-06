//
//  NetworkManager.swift
//  StudyBuddy
//
//  Created by rachel on 5/4/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static func getGroups(completion: @escaping ([Groups]) -> Void ) {
        let getGroup = "http://35.196.189.184/api/groups/"
        Alamofire.request(getGroup, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let groupsResponse = try? jsonDecoder.decode(GroupsResponse.self, from: data) {
                    completion(groupsResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //static func getGroup
    static func getMembers(completion: @escaping ([Users]) -> Void ) {
        let getMember = "http://35.196.189.184/api/group/id/info/"
        Alamofire.request(getMember, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let membersResponse = try? jsonDecoder.decode(MembersResponse.self, from: data) {
                    completion(membersResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createGroup (class_name: String, description: String, location: String, time: String, completion: @escaping (Bool) -> Void) {
        let postGroup = "http://35.196.189.184/api/groups/"
        let parameters: [String: Any] =
        [
            "class_name" : class_name,
            "description" : description,
            "location" : location,
            "time" : time
        ]
        Alamofire.request(postGroup, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let responseGroup = try? jsonDecoder.decode(ResponseGroup.self, from: data) {
                    completion(responseGroup.success)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createUser (name: String, netid: String, password: String, completion: @escaping (Bool) -> Void) {
        let postUser = "http://35.196.189.184/api/users/"
        let parameters: [String: Any] =
        [
            "name": name,
            "netid": netid,
            "password": password
        ]
        Alamofire.request(postUser, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(UserResponse.self, from: data) { completion(userResponse.success)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func loginUser (netid: String, password: String, completion: @escaping (Bool) -> Void) {
        let postLogin = "http://35.196.189.184/api/user/login/"
        let parameters: [String: Any] =
        [
            "netid": netid,
            "password": password
        ]
        Alamofire.request(postLogin, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let loginuserResponse = try? jsonDecoder.decode(LoginUserResponse.self, from: data) {
                    completion(loginuserResponse.success)
                } else {
                    print("Invalid Response Data")
                }
            case .failure (let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func addUserToGroup (user: Users, group: Groups, with completion: @escaping (Bool) -> Void) {
        let postUserToGroup = "http://35.196.189.184//api/user/user.id/group/group.id/add/"
        Alamofire.request(postUserToGroup, method: .post, parameters: [:], encoding: JSONEncoding.default, headers: [:]).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let adduserResponse = try? jsonDecoder.decode(addUserResponse.self, from: data) {
                    completion(adduserResponse.success)
                } else {
                    print("Invalid Response Data")
                }
            case .failure (let error):
                print(error.localizedDescription)
            }
        }
    }
}


