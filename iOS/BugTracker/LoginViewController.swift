//
//  LoginViewController.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    private var usernameTextField:  UITextField!
    private var passwordTextField:  UITextField!

    private var loginButton:        UIButton!
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
        usernameTextField.text = "Charlot"
        self.view.addSubview(usernameTextField)
        
        passwordTextField = UITextField()
        passwordTextField.frame = CGRectMake(usernameTextField.frame.origin.x,  usernameTextField.frame.origin.y + usernameTextField.frame.height * 1.5, usernameTextField.frame.width, usernameTextField.frame.height)
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = UITextBorderStyle.RoundedRect
        passwordTextField.secureTextEntry = true
        passwordTextField.text = "123456"
        self.view.addSubview(passwordTextField)
        
        loginButton = UIButton()
        loginButton.frame = CGRectMake(passwordTextField.frame.origin.x,  passwordTextField.frame.origin.y + passwordTextField.frame.height * 2, passwordTextField.frame.width, passwordTextField.frame.height)
        loginButton.backgroundColor = UIColor.blueColor()
        loginButton.setTitle("Login", forState: UIControlState.Normal)
        loginButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        loginButton.addTarget(self, action: "login", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(loginButton)
        
        signupButton = UIButton()
        signupButton.frame = CGRectMake(loginButton.frame.origin.x,  loginButton.frame.origin.y + loginButton.frame.height * 1.5, loginButton.frame.width, loginButton.frame.height / 4)
        signupButton.setTitle("Sign up", forState: UIControlState.Normal)
        signupButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        signupButton.addTarget(self, action: "signup", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(signupButton)

    }

    func login() {
        PFUser.logInWithUsernameInBackground(usernameTextField.text!, password: passwordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("L'utilisateur s'est correctement connecté")
                gblAfterLogin()
                
                self.performSegueWithIdentifier("showIssueTracker", sender: self)
            } else {
                gblError(error!)
            }
        }
    }
    
    func signup() {
        self.performSegueWithIdentifier("showSignup", sender: self)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
