//
//  ConfirmTweetViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/10/06.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class ConfirmTweetViewController: UIViewController {
    
    var tweetText = ""
    var emotionText = ""
    
    @IBAction func emoteButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
