//
//  loginUserResponse.swift
//  StudyBuddy
//
//  Created by rachel on 5/4/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import Foundation

struct LoginUserResponse: Codable {
    var success: Bool
}

struct ResponseGroup: Codable {
    var success: Bool
}

struct UserResponse: Codable {
    var success: Bool
}

struct addUserResponse: Codable {
    var success: Bool
    var data: Users 
}


