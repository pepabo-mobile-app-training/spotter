//
//  LoginViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/09/27.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushLoginButton(_ sender: Any) {
        performSegue(withIdentifier: "goTimeLine", sender: nil)
    }
    
}
