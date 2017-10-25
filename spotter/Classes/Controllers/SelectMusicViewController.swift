//
//  SelectMusicViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/10/05.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit
import Kingfisher

class SelectMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var micropost = Micropost(userID: 0, content: "")
    var emotionText = ""
    var music = Music()
    var musicList = [Track]()
    
    @IBOutlet weak var emotionLabel: UILabel!
    
    @IBOutlet weak var musicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "musicTableCell")
        musicTableView.estimatedRowHeight = 70
        musicTableView.rowHeight = UITableViewAutomaticDimension
        emotionLabel.text = emotionText
        
        Track.fetchTracklist(playlistID: "1qhPhTZSuy9XfqurvqGwt8") { tracks in
            self.musicList = tracks
            self.musicTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goConfirmTweet") {
            let confirmTweetViewController: ConfirmTweetViewController = segue.destination as! ConfirmTweetViewController
            confirmTweetViewController.emotionText = emotionText
            confirmTweetViewController.micropost = micropost
            confirmTweetViewController.music = music
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: "musicTableCell", for: indexPath) as! MusicTableViewCell
        
        cell.musicImageView.kf.setImage(with: musicList[indexPath.row].imgURL)
        cell.musicLabel.text = musicList[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = musicTableView.cellForRow(at: indexPath) as! MusicTableViewCell
        music.name = cell.musicLabel.text!
        music.url = String(describing: musicList[indexPath.row].url)
        musicTableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "goConfirmTweet", sender: nil)
    }
}
