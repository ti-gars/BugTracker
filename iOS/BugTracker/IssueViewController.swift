//
//  IssueViewController.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-21.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController {
    
    private var currentIssue: Issue!
    
    private var issueTitleLabel:            UILabel!
    private var issueDescriptionTextView:   UITextView!
    private var issueTypeImage:             UIImage!
    private var issueTypeLabel:             UILabel!
    private var issueResolved:              UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Trouve le probleme actuel
        if(gblIssueAssignedToMe) {
            currentIssue = globalIssueAssignedToMe[globalIssueSelected]
        } else {
            currentIssue = globalIssue[globalIssueSelected]
        }
        
        setupView()
    }
    
    func setupView() {
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        issueTitleLabel = UILabel()
        issueTitleLabel.frame = CGRectMake(20, self.navigationController!.navigationBar.frame.height + 20, width - 40, height / 15)
        issueTitleLabel.text = currentIssue.getTitle()
        issueTitleLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(issueTitleLabel)
        
        issueTypeLabel = UILabel()
        issueTypeLabel.frame = CGRectMake(issueTitleLabel.frame.minX, issueTitleLabel.frame.minY + 30, width - issueTitleLabel.frame.minX * 2, height / 15)
        issueTypeLabel.text = currentIssue.getTypeName()
        issueTypeLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(issueTypeLabel)
        
        issueDescriptionTextView = UITextView()
        issueDescriptionTextView.frame = CGRectMake(issueTypeLabel.frame.minX, issueTypeLabel.frame.minY + 60, width - issueTypeLabel.frame.minX * 2, height / 5)
        
        issueDescriptionTextView.editable = false
        issueDescriptionTextView.text = currentIssue.getDescription()
        issueDescriptionTextView.selectable = false
        self.view.addSubview(issueDescriptionTextView)
        
        issueResolved = UIButton()
        issueResolved.frame = CGRectMake(issueDescriptionTextView.frame.minX, issueDescriptionTextView.frame.minY + 60, width - issueDescriptionTextView.frame.minX * 2, height / 15)
        issueResolved.backgroundColor = UIColor.blueColor()
        issueResolved.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        if(currentIssue.isResolved()) {
            issueResolved.setTitle("Reopen", forState: UIControlState.Normal)
            issueResolved.tag = 0
        } else {
            issueResolved.setTitle("Close", forState: UIControlState.Normal)
            issueResolved.tag = 1
        }
        
        issueResolved.addTarget(self, action: "issueResolvedAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(issueResolved)
    }
    
    func issueResolvedAction() {
        if(issueResolved.tag == 0) {
            currentIssue.setResolved(false)
            issueResolved.setTitle("Close", forState: UIControlState.Normal)
            issueResolved.tag = 1
            return
        }

                    issueResolved.tag = 0
        currentIssue.setResolved(true)
        issueResolved.setTitle("Reopen", forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
