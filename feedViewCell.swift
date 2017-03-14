//
//  feedViewCell.swift
//  snapChatProject
//
//  Created by Bryan Tong on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class feedViewCell: UITableViewCell {
    
    @IBOutlet weak var statusIcon: UIImageView!
    @IBOutlet weak var sentBy: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
