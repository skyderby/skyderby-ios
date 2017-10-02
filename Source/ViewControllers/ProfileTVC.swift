//
//  ProfileTVC.swift
//
//  Copyright © 2017 Skyderby. All rights reserved.

import UIKit
import Reusable
import Kingfisher

class ProfileTVC: UITableViewController {

    @IBOutlet weak var titleImageView: UIImageView! {
        didSet {
            titleImageView.layer.borderColor = UIColor.lightGray.cgColor
            titleImageView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var titleLabel: UILabel!

    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 44

        setupUser()
    }

    func setupUser() {
        guard let user = user else { return }

        titleLabel.text = user.name
        titleImageView.kf.setImage(with: user.photo.medium,
                                   placeholder: UIImage(asset: Asset.logo),
                                   options: [.transition(.fade(0.2))])

        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Online Competitions"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.personalScores.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as OnlineCompetitionCell

        if let user = user, user.personalScores.count > indexPath.row {
            cell.configure(result: user.personalScores[indexPath.row])
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class OnlineCompetitionCell: UITableViewCell, Reusable {
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(result: OnlineCompetitionResult) {
        placeLabel.text = String(result.overallRank)
        titleLabel.text = "in \(result.competition.name)"
    }
}
