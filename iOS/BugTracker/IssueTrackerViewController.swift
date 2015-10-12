//
//  IssueTrackerViewController.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-20.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit

class IssueTrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView:   UITableView!
    var refresher:                  UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Tirez pour raffraîchir")
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refresher)
    
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.hidden = false
        tableView.reloadData()
    }
    
    @IBAction func refreshIssue(sender: AnyObject) {

    }
    
    func refresh() {
        gblReloadIssue()
        tableView.reloadData()
        refresher.endRefreshing()
    }
    
    @IBAction func addIssue(sender: AnyObject) {
        self.performSegueWithIdentifier("showAddIssue", sender: self)
    }
    
    //  Table View
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! IssueTableViewCell
        
        cell.issueTitle.text = globalIssue[indexPath.row].getTitle()
        cell.assignedTo.text = globalIssue[indexPath.row].getAssignedTo().getName()
        cell.issueType.image = globalIssue[indexPath.row].getIssueImage()
        cell.resolved.backgroundColor = globalIssue[indexPath.row].isResolved() ? UIColor.greenColor() : UIColor.redColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        globalIssueSelected = indexPath.row
        gblIssueAssignedToMe = false
        
        self.performSegueWithIdentifier("showIssue", sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalIssue.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
