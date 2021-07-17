//
//  UITableViewExtension.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import UIKit

extension UITableView {
    /**
     Generic for cell registration
     - Parameter cellType: UITableViewCell class
     - Parameter bundle: Bundle of the UITableViewCell
     */
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    /**
     Generic for dequeueReusableCell
     - Parameter type: UITableViewCell class
     - Parameter indexPath: IndexPath
     */
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
}
