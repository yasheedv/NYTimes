//
//  UIApplicationExtension.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import UIKit

extension UIApplication {
    /// Provide topViewController in the avialable windows heirarchy 
    class func topViewController(controller: UIViewController? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
