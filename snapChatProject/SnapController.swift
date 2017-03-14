//
//  SnapController.swift
//  snapChatProject
//
//  Created by Bryan Tong on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class SnapController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    /* The entire feed. */
    @IBOutlet weak var snapFeed: UITableView!
    
    /* Storing a snap for the seuge. */
    var segueSnap: Snapchat?
    
    /* Copied below from lab basically. */
    func numberOfSections(in tableView: UITableView) -> Int {
        print(threads.count)
        return threads.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection feed: Int) -> String? {
        return threadNames[feed]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection feed: Int) -> Int {
        print((threads[threadNames[feed]]?.count)!)
        return (threads[threadNames[feed]]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = snapFeed.dequeueReusableCell(withIdentifier: "snapCell", for: indexPath) as! feedViewCell
        let allSnaps: [Snapchat] = threads[threadNames[indexPath.section]]!
        let oneSnap: Snapchat = allSnaps[indexPath.item]
        if (oneSnap.seen) {
            cell.statusIcon.image = #imageLiteral(resourceName: "read")
            print("a read one")
        } else {
            cell.statusIcon.image = #imageLiteral(resourceName: "unread")
            print("an unread one")
        }
        cell.timeStamp.text = oneSnap.timeStamp()
        cell.sentBy.text = oneSnap.author
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let allSnaps: [Snapchat] = threads[threadNames[indexPath.section]]!
        segueSnap = allSnaps[indexPath.item]
        if (segueSnap?.seen)! {
            print("it's been read")
        } else {
            segueSnap?.markAsRead()
            performSegue(withIdentifier: "feedToView", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "feedToView" {
                if let dest = segue.destination as? ViewingController {
                    dest.viewingSnap = segueSnap
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snapFeed.delegate = self
        snapFeed.dataSource = self
    }
    
    /* Got help - had no clue why it didn't show. */
    override func viewWillAppear(_ animated: Bool) {
        snapFeed.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
