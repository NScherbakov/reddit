//
//  RedditPhotoRouter.swift
//  Reddit
//
//  Created by Nikolay on 17.02.2021.
//

import UIKit

final class RedditPhotoRouter {
    private var url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    
    func build() -> RedditPhotoViewController {
        let viewController = ListViewController.storyboardViewController() as RedditPhotoViewController
        let presenter = RedditPhotoPresenter(router: self, url: url)
        viewController.presenter = presenter
        presenter.view = viewController
       
        return viewController
    }
}
