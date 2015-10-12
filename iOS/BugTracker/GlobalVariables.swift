//
//  GlobalVariables.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import Foundation

var ISSUETYPE_BUG = 0
var ISSUETYPE_FEATURES = 1
var ISSUETYPE_TOTRY = 2

var globalIssue: [Issue] = [Issue]()
var globalIssueAssignedToMe: [Issue] = [Issue]()
var globalAppIdea: [AppIdea] = [AppIdea]()
var globalUsers: [User] = [User]()

var globalIssueSelected:      Int = 0
var gblIssueAssignedToMe:     Bool = false