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
    var pushedMicropost = Micropost(userID: 0, content: "")
    var emotionText = ""
    var music = Music()
    
    @IBOutlet weak var tweetTextView: TweetTextView!
    
    @IBAction func emoteButton(_ sender: Any) {
        Micropost.pushMicropost(userID: micropost.userID, content: micropost.content) { micropost in }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        micropost.content += "\n\(emotionText)\n\(music.name)(\(music.url))"
        tweetTextView.text = micropost.content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
