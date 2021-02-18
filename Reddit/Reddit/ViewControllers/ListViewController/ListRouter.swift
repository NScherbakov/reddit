//
//  ListRouter.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import UIKit

protocol ListRouterDelegate: class {
    func showImageWith(url: URL)
}

final class ListRouter {
    private weak var delegate: ListRouterDelegate?
    
    init(delegate: ListRouterDelegate) {
        self.delegate = delegate
    }
    
    func build() -> ListViewController {
        let viewController = ListViewController.storyboardViewController() as ListViewController
        let presenter = ListPresenter(router: self, postRequest: PostRequests())
        viewController.presenter = presenter
        presenter.view = viewController
       
        return viewController
    }
    
    func showImageWith(url: URL) {
        delegate?.showImageWith(url: url)
    }
}
