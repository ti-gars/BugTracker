//
//  SignUpViewController.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    private var usernameTextField:  UITextField!
    private var passwordTextField:  UITextField!
    
    private var signupButton:       UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        usernameTextField = UITextField()
        usernameTextField.frame = CGRectMake(width / 4, height / 3, width / 2, height / 20)
        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(usernameTextField)
        
        passwordTextField = UITextField()
        passwordTextField.frame = CGRectMake(usernameTextField.frame.origin.x,  usernameTextField.frame.origin.y + usernameTextField.frame.height * 1.5, usernameTextField.frame.width, usernameTextField.frame.height)
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = UITextBorderStyle.RoundedRect
        passwordTextField.secureTextEntry = true
        self.view.addSubview(passwordTextField)
        
        signupButton = UIButton()
        signupButton.frame = CGRectMake(passwordTextField.frame.origin.x,  passwordTextField.frame.origin.y + passwordTextField.frame.height * 1.5, passwordTextField.frame.width, passwordTextField.frame.height / 4)
        signupButton.setTitle("Sign up", forState: UIControlState.Normal)
        signupButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        signupButton.addTarget(self, action: "signup", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(signupButton)
        
    }
    
    func signup() {
        var user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                
                gblError(error)
            } else {
                print("Enregistrement effectué avec succès!")
                gblAfterLogin()
                self.performSegueWithIdentifier("showIssueTracker", sender: self)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
