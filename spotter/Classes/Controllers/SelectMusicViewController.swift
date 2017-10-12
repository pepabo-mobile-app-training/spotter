//
//  SelectMusicViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/10/05.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class SelectMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweetText = ""
    var emotionText = ""
    
    @IBOutlet weak var emotionLabel: UILabel!
    
    @IBOutlet weak var musicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicTableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "musicTableCell")
        musicTableView.estimatedRowHeight = 70
        musicTableView.rowHeight = UITableViewAutomaticDimension
        
        emotionLabel.text = emotionText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goConfirmTweet") {
            let confirmTweetViewController: ConfirmTweetViewController = segue.destination as! ConfirmTweetViewController
            confirmTweetViewController.emotionText = emotionText
            confirmTweetViewController.tweetText = tweetText
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: "musicTableCell", for: indexPath) as! MusicTableViewCell
        
        cell.musicImageView.image = UIImage(named: "linkin")
        cell.musicLabel.text = "hogefugapiyohogehoge"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セル選択
        musicTableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "goConfirmTweet", sender: nil)
    }
}
