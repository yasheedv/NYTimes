//
//  CommonLoader.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import UIKit

/// Loader used for NetworkCalls
class CommonLoader: NSObject {
    static var spinnerView: UIView? = nil
    static func showSpinner() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            return
        }
        if spinnerView == nil {
            spinnerView = UIView.init(frame: window.bounds)
            spinnerView!.backgroundColor = .clear
            let activityContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 119, height: 102))
            activityContainerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            activityContainerView.layer.cornerRadius = 10
            let activityIndicator: UIActivityIndicatorView
            activityIndicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
            activityIndicator.color = .white
            activityIndicator.startAnimating()
            activityIndicator.center = spinnerView!.center
            DispatchQueue.main.async {
                guard spinnerView != nil else { return }
                window.addSubview(spinnerView!)
                window.constrainToEdges(spinnerView!)
                spinnerView?.addSubview(activityContainerView)
                spinnerView?.constrainCentered(activityContainerView)
                activityContainerView.addSubview(activityIndicator)
                activityContainerView.constrainCentered(activityIndicator)
            }
        }
    }
    static func hideSpinner() {
        guard spinnerView != nil else {
            return
        }
        DispatchQueue.main.async {
            if spinnerView != nil {
                spinnerView!.removeFromSuperview()
            }
            spinnerView = nil
        }
    }
    
}
