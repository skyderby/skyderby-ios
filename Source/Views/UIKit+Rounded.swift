//
//  UIKit+Rounded.swift
//
//  Copyright © 2017 Evgeny Aleksandrov. All rights reserved.

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    override func awakeFromNib() {
        self.layoutIfNeeded()

        roundLayer()
    }

    override var frame: CGRect {
        didSet {
            roundLayer()
        }
    }

    func roundLayer() {
        self.layer.cornerRadius = frame.size.width / 2
        self.layer.masksToBounds = frame.size.width / 2 > 0
    }
}
