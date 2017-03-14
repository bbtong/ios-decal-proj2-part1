//
//  Snapchat.swift
//  snapChatProject
//
//  Created by Bryan Tong on 3/12/17.
//  Copyright © 2017 org.iosdecal, Bryan Tong. All rights reserved.
//

import Foundation
import UIKit


class Snapchat {
    
    var id: Int?
    var type: String? // Memes, Dog Spots, Random
    var image: UIImage?
    var author: String = "?"
    var date: Date = Date.init()
    var seen: Bool = false
    
    /* Every time we make send a snap, we want to make a new "Snapchat" obj. */
    init(sImage image: UIImage, sAuthor author: String, sFeed feed: String) {
        self.image = image
        self.author = author
        self.date = Date.init()
        self.seen = false
        self.type = feed
    }
    
    /* Marks a snap as read. */
    func markAsRead() {
        seen = true
    }

    
    /* Returns a properly formatted timestamp string. */
    func timeStamp() -> String {
        let timeSinceSent: Double = -self.date.timeIntervalSinceNow // seconds
        let mins = Int(round(timeSinceSent) / 60) // minutes
        let hours = (mins / 60) // hours
        let days = (hours / 24) // days
        let weeks = (days / 7) // weeks
        let months = (weeks / 4) // months
        /* Builds the timestamp. */
        if (mins < 60) {
            return "\(mins)m ago"
        } else if (hours <= 24) {
            return "\(hours)h ago"
        } else if (days < 7) {
            return "\(days)d ago"
        } else if (weeks <= 4) {
            return "\(weeks)w ago"
        } else {
            return "\(months) months ago :("
        }
    }
    
    
}
