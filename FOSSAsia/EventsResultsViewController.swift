//
//  SessionsSearchViewController.swift
//  FOSSAsia
//
//  Created by Jurvis Tan on 7/2/16.
//  Copyright © 2016 FossAsia. All rights reserved.
//

import UIKit

class EventsResultsViewController: EventsBaseViewController {
    
    struct StoryboardConstants {
        static let storyboardName = "ScheduleVC"
        static let viewControllerId = String(EventsResultsViewController)
    }
    
    lazy var visibleEvents: [EventViewModel] = self.allEvents
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowEventDetail") {
            if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
                if let eventNavigationController = segue.destinationViewController as? UINavigationController {
                    let eventViewController = eventNavigationController.topViewController as! EventViewController
                    eventViewController.eventViewModel = visibleEvents[selectedIndexPath.row]
                }
            }
        }
    }
}

// MARK: UITableViewDataSource
extension EventsResultsViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleEvents.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(EventsBaseViewController.kEventCellReuseIdentifier, forIndexPath: indexPath) as! EventCell
        let eventViewModel = visibleEvents[indexPath.row]
        cell.configure(withPresenter: eventViewModel)
        
        return cell
    }
}