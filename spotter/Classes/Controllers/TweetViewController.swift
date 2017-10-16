//
//  TweetViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/09/28.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    var micropost = Micropost(userID: 0, content: "")
    var emotionText = ""
    
    @IBOutlet weak var tweetTextView: TweetTextView!
    
    @IBAction func pushCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pushEmotionButton(_ sender: UIButton) {
        emotionText = sender.currentTitle!
        micropost.content = tweetTextView.text
        performSegue(withIdentifier: "goSelectMusic", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goSelectMusic") {
            let selectMusicViewController: SelectMusicViewController = segue.destination as! SelectMusicViewController
            selectMusicViewController.micropost = micropost
            selectMusicViewController.emotionText = emotionText
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
