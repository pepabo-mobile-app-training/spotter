//
//  TweetViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/09/28.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBAction func pushCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pushEmotionButton(_ sender: Any) {
        performSegue(withIdentifier: "goSelectMusic", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
