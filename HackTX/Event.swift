//
//  Event.swift
//  HackTX
//
//  Created by Drew Romanyk on 8/23/15.
//  Copyright (c) 2015 HackTX. All rights reserved.
//

import Foundation

class Event {
    let dateFormatStr = "yyyy-MM-dd HH:mm:ss"
    
    var id : Int? = 0
    var name: String? = ""
    var type: String? = ""
    var imageUrl: String? = ""
    var startDate: NSDate? = NSDate()
    var endDate: NSDate? = NSDate()
    var startDateStr: String? = ""
    var endDateStr: String? = ""
    var location: Location?
    var description: String? = ""
    var speakerList: [Speaker]?
    
    func convertDateStrToDates() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormatStr
        
        self.startDate = dateFormatter.dateFromString(startDateStr!)
        self.endDate = dateFormatter.dateFromString(endDateStr!)
    }
}