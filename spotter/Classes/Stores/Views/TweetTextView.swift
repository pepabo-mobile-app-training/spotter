//
//  TweetTextView.swift
//  spotter
//
//  Created by komei.nomura on 2017/09/28.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

@IBDesignable
class TweetTextView: UITextView {

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
