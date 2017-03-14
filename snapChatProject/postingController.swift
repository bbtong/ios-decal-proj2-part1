//
//  postingController.swift
//  snapChatProject
//
//  Created by Bryan Tong on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class postingController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedImage: UIImage?
    var selectedFeed: String?
    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var feedTableView: UITableView!    
    
    /* Alerty button time. */
    @IBAction func clickedPost(_ sender: Any) {
        print("it's lit")
        if let success = selectedFeed {
            /* Success UIAlert. */
            var allSnaps: [Snapchat] = threads[success]!
            allSnaps.append(Snapchat(sImage: selectedImage!, sAuthor: "Bryan Tong", sFeed: success))
            threads[success] = allSnaps
            print("snap sent")
            performSegue(withIdentifier: "feedToPicker", sender: self)
            let alertSent = UIAlertController(
                title: "Snapchat sent!",
                message: "To be received by one lucky snapper!",
                preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertSent.addAction(OKAction)
            self.present(alertSent, animated: true, completion: nil)
        } else { // failed to find a string
            let alertFail = UIAlertController(
                title: "No feed selected!",
                message: "You need to select a feed before you can send!",
                preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertFail.addAction(OKAction)
            self.present(alertFail, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "feedToPicker" {

            }
        }
    }
    
    /* So postingController stops complaining.  Referencing lab pretty literally. */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // from ImageFeed.swift
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! smolFeedViewCell
        cell.feedName.text = threadNames[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedFeed = threadNames[indexPath.item]
    }
    
    /* The essentials below. */
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Referencing lab. */
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
