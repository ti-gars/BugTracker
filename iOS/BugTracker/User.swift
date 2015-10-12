//
//  User.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit

class User {
    private var name:       String!
    private var objectId:   String!
    
    init(object: AnyObject) {
        self.name = object["username"] as! String
        self.objectId = object["CustomObjectId"] as! String
    }
    
    func getName() -> String {
        return name
    }
    
    func getObjectId() -> String {
        return objectId
    }
}
