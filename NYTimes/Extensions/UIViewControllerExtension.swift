//
//  UIViewControllerExtension.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import UIKit

extension UIViewController {
    /**
     It's a helper method for performSegue. The provided viewController's class name used segue identifier
     - Parameter viewController: destination UIViewController
     */
    func performSegue<T: UIViewController>(to viewController: T.Type) {
        performSegue(withIdentifier: viewController.className, sender: self)
    }
}
