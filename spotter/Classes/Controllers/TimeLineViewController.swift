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
    
    let userID = 1  // ログイン機能がないためユーザを固定
    var userImageURL: URL?
    var microposts = [Micropost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineView.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineTableViewCell")
        timelineView.estimatedRowHeight = 70
        timelineView.rowHeight = UITableViewAutomaticDimension
        
        setTimelineViewElements()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goTweet") {
            if let navigationController = segue.destination as? UINavigationController {
                let tweetViewController: TweetViewController = navigationController.topViewController as! TweetViewController
                tweetViewController.micropost = Micropost(userID: userID, content: "")
            }
        }
    }
    
    private func setTimelineViewElements() {
        Users.fetchUsers(userID: userID) { users in
            self.userImageURL = users.imgURL
            self.usernameLabel.text = users.name
            self.faceImage.kf.setImage(with: users.imgURL)
        }
        
        Micropost.fetchMicroposts(userID: userID) { microposts in
            self.microposts = microposts.reversed()
            self.timelineView.reloadData()
        }
    }
}
