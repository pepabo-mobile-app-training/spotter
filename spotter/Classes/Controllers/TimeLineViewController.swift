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
    
    //  表示するテキスト
    var DataList:[String] = ["株式会社イーディーエー（英文社名：E.D.A Inc.,株式会社イーディーエー（英文社名：E.D.A Inc.）,株式会社イーディーエー（英文社名：E.D.A Inc.）",
                             "どうもこんにちは!  \n\n 鶴本です。遠藤です！！！ 遠藤です！！！！,　遠藤です！！！！",
                             "AutoLayoutで可変UITableViewCellの実装をしてみました!!!!!!!",
                             "テストテストテストテストテス\nトテストテストテストテストテストテストテストテストテストテストテストテストテストテス\nトテストテストテスト\n\n",
                             "便利です。"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineView.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineTableViewCell")
        
        // tableviewcellの表示を可変対応にする。
        timelineView.estimatedRowHeight = 50
        timelineView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timelineView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        cell.faceImageView.image = UIImage(named: "komei")
//        cell.tweetText.text = "FF9ありがとうございます! #うれしい「バンザイ ~好きでよかった~」ウルフルズ http://曲が聞けるリンクFF9ありがとうございます! #うれしい「バンザイ ~好きでよかった~」ウルフルズ "
        let str = self.DataList[indexPath.row]
        cell.tweetText.text = str
        
        
        return cell
    }
}
