//
//  AppCoordinator.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import UIKit

final class AppCoordinator {
    private let window: UIWindow
    private let navigation: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigation = UINavigationController()
        self.window.rootViewController = navigation
    }
    
    func start() {
        let router = ListRouter(delegate: self)
        let viewController = router.build()
        navigation.setViewControllers([viewController], animated: true)
    }
    
    func restorationStartWith(url: URL) {
        let listRouter = ListRouter(delegate: self)
        let listVC = listRouter.build()
        
        let photoRouter = RedditPhotoRouter(url: url)
        let photoVC = photoRouter.build()
        
        navigation.setViewControllers([listVC, photoVC], animated: true)
    }
}

// MARK: - Delegates

extension AppCoordinator: ListRouterDelegate {
    func showImageWith(url: URL) {
        let router = RedditPhotoRouter(url: url)
        let viewController = router.build()
        navigation.pushViewController(viewController, animated: true)
    }
}
