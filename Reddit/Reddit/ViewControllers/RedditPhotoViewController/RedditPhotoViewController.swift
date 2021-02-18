//
//  RedditPhotoViewController.swift
//  Reddit
//
//  Created by Nikolay on 17.02.2021.
//

import UIKit

final class RedditPhotoViewController: BaseViewController {
    
    // MARK: - Private properties
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    var identifier: String?
    
    // MARK: - Public properties
    
    var presenter: RedditPhotoViewOutput?
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configureNavBar()
    }
}

// MARK: - Private

private extension RedditPhotoViewController {
    func configureScrollView() {
        scrollView.maximumZoomScale = 2
        scrollView.minimumZoomScale = 0.5
    }
    
    func configureNavBar() {
        let save = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        navigationItem.rightBarButtonItem = save
    }
    
    func updateConstraintsForSize(_ size: CGSize) {
        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        
        view.layoutIfNeeded()
    }
}

// MARK: - Actions

private extension RedditPhotoViewController {
    @objc func saveTapped() {
        presenter?.save(image: imageView.image)
    }
}

// MARK: - UIScrollViewDelegate

extension RedditPhotoViewController: UIScrollViewDelegate {
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

// MARK: - RedditPhotoViewInput

extension RedditPhotoViewController: RedditPhotoViewInput {
    func show(image: UIImage) {
        imageView.image = image
    }
    
    func show(message: String) {
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
}
