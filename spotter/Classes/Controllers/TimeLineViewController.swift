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
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshTimeline(sender:)), for: .valueChanged)
        timelineView.addSubview(refreshControl)
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
        
        let tweetText = microposts[indexPath.row].content
        let urlTextArray = getMatchStrings(targetString: tweetText, pattern: "(http://|https://){1}[\\w\\.\\-/:]+")
        if (urlTextArray.count == 0) {
            cell.tweetText.text = tweetText
            return cell
        }
        let urlRange = (tweetText as NSString).range(of: urlTextArray[0])
        let attributedString = NSMutableAttributedString(string: tweetText)
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: urlRange)
        cell.tweetText.attributedText = attributedString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = timelineView.cellForRow(at: indexPath) as! TimelineTableViewCell
        let urlTextArray = getMatchStrings(targetString: cell.tweetText.text!, pattern: "(http://|https://){1}[\\w\\.\\-/:]+")
        if (urlTextArray.count != 0) {
            let url = URL(string: urlTextArray[0])
            if UIApplication.shared.canOpenURL(url!){
                UIApplication.shared.open(url!)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goTweet") {
            if let navigationController = segue.destination as? UINavigationController {
                let tweetViewController: TweetViewController = navigationController.topViewController as! TweetViewController
                tweetViewController.micropost = Micropost(userID: userID, content: "")
            }
        }
    }
    
    func setTimelineViewElements() {
        Users.fetchUsers(userID: userID) { users in
            self.userImageURL = users.imgURL
            self.usernameLabel.text = users.name
            self.faceImage.kf.setImage(with: users.imgURL)
        }
        
        Micropost.fetchMicroposts(userID: userID) { microposts in
            self.microposts = microposts
            self.timelineView.reloadData()
        }
    }
    
    @objc func refreshTimeline(sender: UIRefreshControl) {
        setTimelineViewElements()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sender.endRefreshing()
        }
    }
    
    // 正規表現にマッチした文字列を格納した配列を返す
    func getMatchStrings(targetString: String, pattern: String) -> [String] {
        var matchStrings:[String] = []
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let targetStringRange = NSRange(location: 0, length: (targetString as NSString).length)
            
            let matches = regex.matches(in: targetString, options: [], range: targetStringRange)
            
            for match in matches {
                let range = match.range(at: 0)
                let result = (targetString as NSString).substring(with: range)
                
                matchStrings.append(result)
            }
            return matchStrings
        } catch {
            print("error: getMatchStrings")
        }
        return []
    }
}
