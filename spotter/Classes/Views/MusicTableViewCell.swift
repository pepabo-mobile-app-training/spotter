//
//  MusicTableViewCell.swift
//  spotter
//
//  Created by komei.nomura on 2017/10/05.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var musicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
