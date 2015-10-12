//
//  GlobalFunction.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit
import Parse

func gblAlert(message: String) {
    let alert = UIAlertView()
    alert.title = message
    alert.addButtonWithTitle("Ok")
    alert.show()
}

func gblError(error: NSError) {
    gblAlert("Erreur: \(error.code)")
    print("Erreur: \(error.code)")
}

func gblAfterLogin() {
    gblLoadUser()
    gblLoadIssue()
    gblGetIssueAssignedToMe()
    gblGetAppIdea()
}

func gblLoadUser() {
    let query = PFQuery(className:"_User")
    do {
        let objects = try query.findObjects()
        print("GblLoadUser")
        for object in objects {
            globalUsers.append(User(object: object))
        }
    } catch {
        print("Erreur")
    }
}

func gblLoadIssue() {
    let query = PFQuery(className:"Issue")
    
    do {
        let objects = try query.findObjects()
        print("GblLoadIssue")
        for object in objects {
            globalIssue.append(Issue(object: object))
        }
    } catch {
        print("Erreur")
    }
    
    
}

func gblGetIssueAssignedToMe() {
    for issue in globalIssue {
        if(issue.getAssignedTo().getName() == PFUser.currentUser()!.username) {
            globalIssueAssignedToMe.append(issue)
        }
    }
}

func getUser(user: PFUser) -> User {
    let objectId = user.objectId
    
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

func gblGetAppIdea() {
    let query = PFQuery(className: "AppIdea")
    
    do {
        let objects = try query.findObjects()
        for object in objects {
            globalAppIdea.append(AppIdea(object: object))
        }
    } catch {
        gblAlert("Erreur")
    }
    
}

func gblReloadIssue() {
    globalIssue.removeAll(keepCapacity: false)
    gblLoadIssue()
}