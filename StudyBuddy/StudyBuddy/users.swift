//
//  users.swift
//  StudyBuddy
//
//  Created by rachel on 5/4/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import Foundation
import UIKit

struct MembersResponse: Codable {
    var data: [Users]
}

struct Users: Codable {
    var id: Int
    var name: String
    var netid: String
    var password: String 


init(id: Int, name: String, netid: String, password: String) {
    self.id = id
    self.name = name
    self.netid = netid
    self.password = password
    
}
}
