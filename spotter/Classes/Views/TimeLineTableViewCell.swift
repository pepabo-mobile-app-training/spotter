//
//  TimelineTableViewCell.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/02.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var tweetText: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
