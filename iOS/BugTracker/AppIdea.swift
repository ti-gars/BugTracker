//
//  AppIdea.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 15-10-06.
//  Copyright © 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit

class AppIdea {
    
    private var appIdeaTitle:   String!
    
    init(object: AnyObject) {
        self.appIdeaTitle = object["Title"] as! String
    }
    
    func title() -> String {
        return appIdeaTitle
    }
}