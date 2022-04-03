//
//  ViewController.swift
//  VKTestForMobileUp
//
//  Created by Alexey Yarov on 02.04.2022.
//

import UIKit
import SwiftyVK

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginButton.layer.cornerRadius = 8
//        navigationController?.isToolbarHidden = true
        
    }

    // Кнопка логина получает токен + userID при логине
    
    @IBOutlet weak var loginButton: UIButton!
    @objc func loginAction(sender: UIButton!) {
        if (VK.sessions.default.state == .authorized) {
          guard let vc = storyboard?.instantiateViewController(identifier: "galleryViewController")
          else {return}
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        VK.sessions.default.logIn(
                    onSuccess: { info in
                        print("SwiftyVK: success authorize with", info)
                    },
                    onError: { error in
                        print("SwiftyVK: authorize failed with", error)
                    })
            }
}


