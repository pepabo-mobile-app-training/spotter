//
//  TimelineTableViewCell.swift
//  spotter
//
//  Created by futoshi.endo on 2017/10/02.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

@IBDesignable
class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var tweetText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
}
