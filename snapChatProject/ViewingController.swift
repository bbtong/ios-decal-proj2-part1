//
//  ViewingController.swift
//  snapChatProject
//
//  Created by Bryan Tong on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class ViewingController: UIViewController {
    
    var viewingSnap: Snapchat?
    @IBOutlet weak var viewingAuthor: UILabel!
    @IBOutlet weak var bigViewingSnap: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        if let snapchat = viewingSnap {
            bigViewingSnap.image = snapchat.image
            viewingAuthor.text = snapchat.author
        }
    }
    
    @IBAction func tapped(_ sender: Any) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
         self.navigationController?.popViewController(animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
