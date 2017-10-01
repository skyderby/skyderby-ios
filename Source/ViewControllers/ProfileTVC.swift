//
//  ProfileTVC.swift
//
//  Copyright © 2017 Skyderby. All rights reserved.

import UIKit

class ProfileTVC: UITableViewController {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OnlineCompetitionCell", for: indexPath)

        return cell
    }
}

class OnlineCompetitionCell: UITableViewCell {
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(place: Int, name: String) {
        placeLabel.text = String(place)
        titleLabel.text = "in \(name)"
    }
}
