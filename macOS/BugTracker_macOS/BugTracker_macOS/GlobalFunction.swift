//
//  GlobalFunction.swift
//  BugTracker_macOS
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import Foundation
import Parse

func gblAlert(message: String) {
    println("Alerte \(message)")
}

func gblError(error: NSError) {
    gblAlert("Erreur: \(error.code)")
    println("Erreur: \(error.code)")
}

func gblAfterLogin() {
    gblLoadUser()
    gblLoadIssue()
}

func gblLoadUser() {
    var query = PFQuery(className:"_User")
    var objects = query.findObjects()
    
    println("GblLoadUser")
    for object in objects! {
        globalUsers.append(User(object: object))
    }
}

func gblLoadIssue() {
    var query = PFQuery(className:"Issue")
    var objects = query.findObjects()
    
    println("GblLoadIssue")
    for object in objects! {
        globalIssue.append(Issue(object: object))
    }
}

func getUser(user: PFUser) -> User {
    var objectId = user.objectId
    
    for user in globalUsers {
        if(user.getObjectId() == objectId) {
            return user
        }
    }
    
    return User(object: "-1")
}

func getUser(objectId: String) -> User {
    for user in globalUsers {
        if(user.getObjectId() == objectId) {
            return user
        }
    }
    
    return User(object: "-1")
}

func gblReloadIssue() {
    globalIssue.removeAll(keepCapacity: false)
    gblLoadIssue()
}