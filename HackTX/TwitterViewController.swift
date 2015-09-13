//
//  TwitterViewController.swift
//  HackTX
//
//  Created by Rohit Datta on 7/11/15.
//  Copyright (c) 2015 HackTX. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let topLayoutGuide = CGFloat(60)
//        tableView.contentInset = UIEdgeInsetsMake(topLayoutGuide, 0, 0, 0)
		if Reachability.isConnectedToNetwork() == false {
			println("Internet connection FAILED")
			var alert = UIAlertView(title: "No Internet Connection", message: "The HackTX app requires an internet connection to work. Talk to a volunteer about getting Internet access.", delegate: nil, cancelButtonTitle: "OK")
			alert.show()
		}
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if let validSession = session {
                let client = Twitter.sharedInstance().APIClient
                self.dataSource = TWTRUserTimelineDataSource(screenName: "hacktx", APIClient: client)
            } else {
                println("error: \(error.localizedDescription)")
            }
        }
    }
    
    // Setup Google Analytics for the controller
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var tracker = GAI.sharedInstance().defaultTracker
        tracker.set(kGAIScreenName, value: "Twitter")
        
        var builder = GAIDictionaryBuilder.createScreenView()
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
	
}