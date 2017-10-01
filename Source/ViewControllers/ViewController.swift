//
//  ViewController.swift
//
//  Copyright © 2017 Skyderby. All rights reserved.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userIdField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func showProfile() {
        guard let userIdText = userIdField.text, let userId = Int(userIdText) else {
            return
        }

        skyderbyProvider.request(.getUser(userId: userId)) { _ in
            let vc = StoryboardScene.Main.profileTVC.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
