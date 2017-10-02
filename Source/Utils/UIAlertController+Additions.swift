//
//  UIAlertController+Additions.swift
//
//  Copyright © 2017 Evgeny Aleksandrov. All rights reserved.

import UIKit

extension UIAlertController {
    static func show(title: String, message: String? = nil, cancelTitle: String = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        UIApplication.shared.topViewController?.present(alertController, animated: true, completion: nil)
    }

    static func askToConfirm(title: String,
                             message: String? = nil,
                             cancelTitle: String = "Cancel",
                             okTitle: String = "OK",
                             style: UIAlertActionStyle = .default,
                             completion: @escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let okAction = UIAlertAction(title: okTitle, style: style) { _ in
            completion()
        }
        alertController.addAction(okAction)

        UIApplication.shared.topViewController?.present(alertController, animated: true, completion: nil)
    }
}

extension UIApplication {
    var topViewController: UIViewController? {
        var presentedVC = self.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController {
            presentedVC = pVC
        }

        return presentedVC
    }
}
