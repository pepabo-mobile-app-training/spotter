//
//  SelectMusicViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/10/05.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class SelectMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var musicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicTableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "musicTableCell")
        musicTableView.estimatedRowHeight = 70
        musicTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        self.performSegue(withIdentifier: "toConfirmTweet", sender: nil)
    }
}
