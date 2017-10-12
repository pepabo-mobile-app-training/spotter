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

    var DataList:[String] = ["FF9ありがとうございます! #うれしい「バンザイ ~好きでよかった~」ウルフルズ http://曲が聞けるリンクFF9ありがとうございます! #うれしい「バンザイ ~好きでよかった~」ウルフルズ ",
                             "どうもこんにちは!  \n\n こーめいとみせかけて遠藤です！！！ 遠藤です！！！！,　遠藤です！！！！",
                             "AutoLayoutで可変UITableViewCellの実装をしてみました!!!!!!!",
                             "テストテストテストテストテス\nトテストテストテストテストテストテストテストテストテストテストテストテストテストテス\nトテストテストテスト\n\n",
                             "便利です。"]
    
    var userImageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineView.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineTableViewCell")
        timelineView.estimatedRowHeight = 70
        timelineView.rowHeight = UITableViewAutomaticDimension
        
        Users.fetchUsers(userID: 1){ users in
            
            self.userImageURL = users.imgURL
            self.usernameLabel.text = users.name
            self.faceImage.kf.setImage(with: users.imgURL)
            
            self.timelineView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = timelineView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        guard let profile_url = self.userImageURL else{
            return UITableViewCell()
        }
        
        cell.faceImageView.kf.setImage(with: profile_url)
        cell.tweetText.text = self.DataList[indexPath.row]
        return cell
    }
}
