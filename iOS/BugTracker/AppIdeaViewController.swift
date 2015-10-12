//
//  AssignedToMeViewController.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 2015-09-21.
//  Copyright (c) 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit

class AppIdeaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var refresher:        UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Tirez pour raffraîchir")
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refresher)
    }
    
    func refresh() {
        self.refresher.endRefreshing()
    }

    //  Table View
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! AppIdeaTableViewCell
        cell.ideaNameLabel.text = globalAppIdea[indexPath.row].title()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalAppIdea.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
