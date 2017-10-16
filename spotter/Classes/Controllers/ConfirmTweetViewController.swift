//
//  ConfirmTweetViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/10/06.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class ConfirmTweetViewController: UIViewController {
    
    var micropost = Micropost(userID: 0, content: "")
    var emotionText = ""
    var music = Music()
    
    @IBOutlet weak var tweetTextView: TweetTextView!
    
    @IBAction func emoteButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.text = "\(micropost.content)\n\(emotionText)\n\(music.name)(\(music.url))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
