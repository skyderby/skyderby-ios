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

        skyderbyProvider.request(.getUser(userId: userId)) { result in
            if case let .success(moyaResponse) = result {
                let decoder = JSONDecoder()
                let decodeFormatter = DateFormatter()
                decodeFormatter.dateFormat = "YYYY-MM-dd"
                decoder.dateDecodingStrategy = .formatted(decodeFormatter)
                let user = try? decoder.decode(User.self, from: moyaResponse.data)

                let vc = StoryboardScene.Main.profileTVC.instantiate()
                vc.user = user
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
