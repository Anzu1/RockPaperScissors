//
//  NotificationController.swift
//  RockPaperScissors WatchKit Extension
//
//  Created by appcamp on 26/07/15.
//  Copyright (c) 2015 Dawid Guze. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet weak var alertLabel: WKInterfaceLabel!
    @IBOutlet weak var highscoreLabel: WKInterfaceLabel!
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
/*
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        i        completionHandler(.Custom)
    }*/
    
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        if let highscore = remoteNotification["highscore"] as? String {
            if !highscore.isEmpty {
                highscoreLabel.setText("Last highscore: \(highscore)")
            }
        }
        
        if let remoteAps: NSDictionary = remoteNotification["aps"] as? NSDictionary {
            if let remoteAlert: NSDictionary = remoteAps["alert"] as? NSDictionary {
                if let remoteBody = remoteAlert["body"] as? String {
                    alertLabel.setText(remoteBody)
                }
            }
        }
        
        completionHandler(.Custom)
        
    }
    
}
