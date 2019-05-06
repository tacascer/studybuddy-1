//
//  groups.swift
//  StudyBuddy
//
//  Created by rachel on 4/26/19.
//  Copyright © 2019 rachel. All rights reserved.
//

import Foundation
import UIKit

struct GroupsResponse: Codable {
    var data: [Groups]
}

struct Groups: Codable {
    var id: Int
    var class_name: String
    var description: String
    var time: String
    var location: String
    
    init(id: Int, class_name: String, description: String, time: String, location: String) {
        self.id = id
        self.class_name = class_name
        self.description = description
        self.time = time
        self.location = location
    }
        
}
