//
//  RedditPhotoPresenter.swift
//  Reddit
//
//  Created by Nikolay on 17.02.2021.
//

import UIKit

final class RedditPhotoPresenter: NSObject {
    weak var view: RedditPhotoViewInput?
    private let router: RedditPhotoRouter
    private let url: URL?
    
    init(router: RedditPhotoRouter, url: URL?) {
        self.router = router
        self.url = url
        super.init()
        self.getImage()
    }
}

// MARK: - ListViewOutput

extension RedditPhotoPresenter: RedditPhotoViewOutput {
    func save(image: UIImage?) {
        guard let image = image else {
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        view?.showLoader()
    }
}

// MARK: Private

private extension RedditPhotoPresenter {
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            view?.show(message: error.localizedDescription)
        } else {
            view?.show(message: "Saved")
        }
        
        view?.hideLoader()
    }
    
    func getImage() {
        guard let url = url else {
            view?.show(message: RedditError.defaultError.localizedDescription)
            return
        }
        
        view?.showLoader()
        ImageLoader.loadImage(with: url) { image in
            DispatchQueue.main.async {
                self.view?.hideLoader()
                
                guard let image = image else {
                    self.view?.show(message: RedditError.defaultError.localizedDescription)
                    return
                }
                
                self.view?.show(image: image)
                Restoration.shared.url = url
            }
        }
    }
}
