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

        // Do any additional setup after loading the view.
       timelineView.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "myTableCell")
        
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath) as! TimelineTableViewCell
        
        cell.faceImageView.image = UIImage(named: "komei")
        cell.tweetText.text = "FF9ありがとうございます! #うれしい「バンザイ ~好きでよかった~」ウルフルズ http://曲が聞けるリンク "
        
        return cell
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
