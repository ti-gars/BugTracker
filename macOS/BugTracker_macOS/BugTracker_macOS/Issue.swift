//
//  Issue.swift
//  BugTracker_macOS
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import Parse

class Issue {
    
    private var title:          String!
    private var description:    String!
    private var type:           Int!
    
    private var assignedTo:     User!
    
    init(object: AnyObject) {
        self.title = object["Title"] as! String
        self.description = object["Description"] as! String
        self.type = object["Type"] as! Int
        var user = getUser(object["AssignedTo"] as! PFUser)
        
        self.assignedTo = user.getObjectId() == "-1" ? nil : user
        
    }
    
    init(object: AnyObject, objectId: String) {
        self.title = object["Title"] as! String
        self.description = object["Description"] as! String
        self.type = object["Type"] as! Int
        var user = getUser(objectId)
        
        self.assignedTo = user.getObjectId() == "-1" ? nil : user
        
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getType() -> Int {
        return type
    }
    
    func getTypeName() -> String {
        if(type == ISSUETYPE_BUG) {
            return "Bug"
        }
        
        if(type == ISSUETYPE_FEATURES) {
            return "Features"
        }
        
        if(type == ISSUETYPE_TOTRY) {
            return "To Try"
        }
        
        return "nil"
    }
    
    func getAssignedTo() -> User {
        return assignedTo
    }
}
