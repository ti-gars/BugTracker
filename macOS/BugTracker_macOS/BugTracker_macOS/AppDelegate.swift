//
//  AppDelegate.swift
//  BugTracker_macOS
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import Cocoa
import Parse

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        Parse.setApplicationId("FSmlkIcmy2u0COpbVyCGX5QXSbRR9FCDGJPIO4Hh", clientKey: "Uhw8fOVIWDi32ktxnessey1DxQVLalsfSuNlPyU9")
        PFAnalytics.trackAppOpenedWithLaunchOptions(nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

