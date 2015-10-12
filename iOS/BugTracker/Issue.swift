//
//  Issue.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit
import Parse

class Issue {
    
    private var title:          String!
    private var description:    String!
    private var type:           Int!
    
    private var assignedTo:     User!
    private var resolved:       Bool!
    private var objectId:       String!
    
    init(object: AnyObject) {
        self.title = object["Title"] as! String
        self.description = object["Description"] as! String
        self.type = object["Type"] as! Int
        let user = getUser(object["AssignedTo"] as! PFUser)
        
        self.assignedTo = user.getObjectId() == "-1" ? nil : user
        self.resolved = object["Resolved"] as! Bool
        self.objectId = object["CustomObjectId"] as! String
    }
    
    init(object: AnyObject, objectId: String) {
        self.title = object["Title"] as! String
        self.description = object["Description"] as! String
        self.type = object["Type"] as! Int
        let user = getUser(objectId)
        
        self.assignedTo = user.getObjectId() == "-1" ? nil : user
        self.resolved = object["Resolved"] as! Bool
        self.objectId = object["CustomObjectId"] as! String
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
    
    func getIssueImage() -> UIImage {
        if(type == ISSUETYPE_BUG) { return UIImage(named: "bug")! }
        if(type == ISSUETYPE_FEATURES) { return UIImage(named: "features")! }
        if(type == ISSUETYPE_TOTRY) { return UIImage(named: "toTry")! }
        
        return UIImage(named: "nothing")!
    }
    
    func setResolved(resolved: Bool) {
        self.resolved = resolved
        
        setResolvedOnParse(resolved)
    }
    
    func setResolvedOnParse(resolved: Bool) {
        let query = PFQuery(className: "Issue")
        query.getObjectInBackgroundWithId(objectId) {
            (issue: PFObject?, error: NSError?) -> Void in
            if error != nil {
                gblError(error!)
            } else if let issue = issue {
                issue.setValue(resolved, forKey: "Resolved")
                
                issue.saveInBackground()
            }
        }
    }
    
    func isResolved() -> Bool {
        return resolved
    }
}
