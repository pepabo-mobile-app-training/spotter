//
//  TimeLineViewController.swift
//  spotter
//
//  Created by futoshi.endo on 2017/09/29.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var timelineView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineView.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineTableViewCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timelineView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        cell.faceImageView.image = UIImage(named: "komei")
        cell.tweetText.text = "FF9ありがとうございます! #うれしい「バンザイ ~好きでよかった~」ウルフルズ http://曲が聞けるリンク"
        
        
        return cell
    }
}
