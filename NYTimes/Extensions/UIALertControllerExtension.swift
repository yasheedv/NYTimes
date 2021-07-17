//
//  UIALertControllerExtension.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import UIKit

extension UIAlertController {
    /**
     Show alert on the topViewController
     - Parameter title: Alert Title
     - Parameter message: Alert message
     - Parameter primaryButtonTitle: Right button title
     - Parameter primaryButtonAction: Call back for right button action
     - Parameter secondaryButtonTitle: Left button title
     - Parameter secondaryButtonAction: Call back for left button action
     */
    static func show(title: String?,
                           message: String?,
                           primaryButtonTitle: String = "OK",
                           primaryButtonAction: (() -> Void)? = nil,
                           secondaryButtonTitle: String? = nil,
                           secondaryButtonAction: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            guard let rootViewController = UIApplication.topViewController() else {
                return
            }
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let primaryAction = UIAlertAction(title: primaryButtonTitle, style: .default) { (_) in
                primaryButtonAction?()
            }
            if let secondaryTitle = secondaryButtonTitle {
                let secondaryAction = UIAlertAction(title: secondaryTitle, style: .default) { (_) in
                    secondaryButtonAction?()
                }
                alertController.addAction(secondaryAction)
            }
            alertController.addAction(primaryAction)
            rootViewController.present(alertController, animated: true, completion: nil)
        }
    }
}
