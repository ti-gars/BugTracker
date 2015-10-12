//
//  LoginViewController.swift
//  BugTracker_macOS
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import Cocoa
import Parse

class LoginViewController: NSViewController {
    
    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func login(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameTextField.stringValue, password: passwordTextField.stringValue) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                println("L'utilisateur s'est correctement connecté")
                gblAfterLogin()
                

                let mainStoryboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)!
                let sourceViewController = mainStoryboard.instantiateControllerWithIdentifier("issueTrackerView") as! NSViewController
                self.insertChildViewController(sourceViewController, atIndex: 0)
                self.view.addSubview(sourceViewController.view)
                self.view.frame = sourceViewController.view.frame
                
            } else {
                gblError(error!)
            }
        }
    }
    
    
    @IBAction func signup(sender: AnyObject) {
        
    }
}
