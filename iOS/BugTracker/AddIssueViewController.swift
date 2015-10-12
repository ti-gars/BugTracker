//
//  AddIssueViewController.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit
import Parse

class AddIssueViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var titleTextField:         UITextField!
    private var descriptionTextView:    UITextView!
    private var typePickerView:         UIPickerView!
    private var assignedToPickerView:   UIPickerView!
    
    private var saveIssueButton:        UIButton!
    private var typePicker = ["Bug", "Features", "To Try"]
    private var typeValue = 0
    private var userValue = 0
    
    private var typeTag = 0
    private var assignedToTag = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.tabBarController?.tabBar.hidden = true
        setupView()
    }
    
    func setupView() {
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        titleTextField = UITextField()
        titleTextField.frame = CGRectMake(width / 30, height / 8, width - (width / 30) * 2, height / 20)
        titleTextField.borderStyle = UITextBorderStyle.RoundedRect
        titleTextField.placeholder = "Title"
        self.view.addSubview(titleTextField)
        
        descriptionTextView = UITextView()
        descriptionTextView.frame = CGRectMake(titleTextField.frame.origin.x, titleTextField.frame.origin.y * 2.4, titleTextField.frame.width, height / 10)
        descriptionTextView.layer.borderColor = UIColor.grayColor().CGColor
        self.view.addSubview(descriptionTextView)
        
        typePickerView = UIPickerView()
        typePickerView.frame = CGRectMake(descriptionTextView.frame.origin.x, descriptionTextView.frame.origin.y * 1.4, descriptionTextView.frame.width, descriptionTextView.frame.height)
        typePickerView.delegate = self
        typePickerView.tag = typeTag
        self.view.addSubview(typePickerView)
        
        assignedToPickerView = UIPickerView()
        assignedToPickerView.frame = CGRectMake(descriptionTextView.frame.origin.x, typePickerView.frame.origin.y * 1.4, descriptionTextView.frame.width, descriptionTextView.frame.height)
        assignedToPickerView.delegate = self
        assignedToPickerView.tag = assignedToTag
        self.view.addSubview(assignedToPickerView)
        
        saveIssueButton = UIButton()
        saveIssueButton.frame = CGRectMake(descriptionTextView.frame.origin.x, self.view.frame.height - self.navigationController!.tabBarController!.tabBar.frame.height * 2 + 10, descriptionTextView.frame.width, descriptionTextView.frame.height)
        saveIssueButton.backgroundColor = UIColor.blueColor()
        saveIssueButton.setTitle("Save", forState: UIControlState.Normal)
        saveIssueButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        saveIssueButton.addTarget(self, action: "saveIssue", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(saveIssueButton)
    }
    
    func saveIssue() {
        let issue = PFObject(className: "Issue")
        issue["Title"] = titleTextField.text!
        issue["Description"] = descriptionTextView.text
        issue["Type"] = typeValue
        
        let pointer = PFObject(withoutDataWithClassName: "_User", objectId: globalUsers[userValue].getObjectId())
        issue["AssignedTo"] = pointer
        issue["Resolved"] = false
        do {
            try issue.save()
        } catch {
            gblAlert("Veuillez rééssayer!")
        }
        
        let query = PFQuery(className: "Issue")
        query.getObjectInBackgroundWithId(issue.objectId!, block: {
            (object: PFObject?, error: NSError?) -> Void in
            
            object?.setValue(issue.objectId!, forKey: "CustomObjectId")
            do {
                try object!.save()
            } catch {
                gblAlert("Veuillez rééssayer!")
            }
        })
        
        //        PFCloud.callFunction("createIssue", withParameters: ["title": titleTextField.text, "description": descriptionTextField.text, "type" : typeValue, "assignedTo" : "M04HyM4nmJ"])
        
    }
    
    
    //  Picker View
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == typeTag) {
            return typePicker.count
        }
        
        return globalUsers.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == typeTag) {
            typeValue = row
        } else {
            userValue = row
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(pickerView.tag == typeTag) {
            return typePicker[row]
        }
        
        return globalUsers[row].getName()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
