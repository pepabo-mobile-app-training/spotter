//
//  TimeLineViewController.swift
//  spotter
//
//  Created by futoshi.endo on 2017/09/29.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit
import Kingfisher

class TimeLineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var timelineView: UITableView!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var microposts = [Micropost]()

    var userImageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineView.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineTableViewCell")
        timelineView.estimatedRowHeight = 70
        timelineView.rowHeight = UITableViewAutomaticDimension
        
        setTimelineViewElements(userID: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return microposts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timelineView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        guard let profile_url = self.userImageURL else {
            return UITableViewCell()
        }
        
        cell.faceImageView.kf.setImage(with: profile_url)
        cell.tweetText.text = microposts[indexPath.row].content
        return cell
    }
    
    private func setTimelineViewElements(userID: Int) {
        Users.fetchUsers(userID: 1) { users in
            self.userImageURL = users.imgURL
            self.usernameLabel.text = users.name
            self.faceImage.kf.setImage(with: users.imgURL)
        }
        
        Micropost.fetchMicroposts(userID: 1) { microposts in
            self.microposts = microposts
            self.timelineView.reloadData()
        }
    }
}
