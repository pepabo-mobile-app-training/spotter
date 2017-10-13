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
    var musicName = ""
    var musicURL = ""
    
    @IBOutlet weak var tweetTextView: TweetTextView!
    
    @IBAction func emoteButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.text = "\(tweetText)\n\(emotionText)\n\(musicName)(\(musicURL))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
