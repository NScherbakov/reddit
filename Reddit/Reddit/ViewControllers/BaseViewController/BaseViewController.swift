//
//  BaseViewController.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import UIKit

class BaseViewController: UIViewController {
    private static let loaderTag = 9_999
    
    // MARK: - Public
    
    func showLoader() {
        let previousIndicator = view.viewWithTag(BaseViewController.loaderTag)
        previousIndicator?.removeFromSuperview()
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.tag = BaseViewController.loaderTag
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func hideLoader() {
        let indicator = view.viewWithTag(BaseViewController.loaderTag)
        indicator?.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }
}
