//
//  LoginViewController.swift
//  spotter
//
//  Created by komei.nomura on 2017/09/27.
//  Copyright © 2017年 GMO Pepabo. All rights reserved.
//

import UIKit
import SpotifyLogin

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        Tracks.fetchTracklist(playlistID: "1qhPhTZSuy9XfqurvqGwt8"){ tracks in
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func pushLoginButton(_ sender: Any) {
        SpotifyLoginPresenter.login(from: self, scopes: [.streaming, .userLibraryRead])
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loginSuccessful),
                                               name: .SpotifyLoginSuccessful,
                                               object: nil)
    }
    @objc func loginSuccessful() {
        SpotifyLogin.shared.getAccessToken { token, error in
            if(token != nil && error == nil) {
                self.performSegue(withIdentifier: "goTimeline", sender: nil)
            }
        }
    }
}
