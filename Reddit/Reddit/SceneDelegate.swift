//
//  SceneDelegate.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let activity = session.stateRestorationActivity,
           let url = activity.userInfo?[Restoration.shared.restorationKey] as? URL {
            
            if let windowScene = scene as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                appCoordinator = AppCoordinator(window: window)
                appCoordinator.restorationStartWith(url: url)
                self.window = window
                window.makeKeyAndVisible()
            }
        } else {
            if let windowScene = scene as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                appCoordinator = AppCoordinator(window: window)
                appCoordinator.start()
                self.window = window
                window.makeKeyAndVisible()
            }
        }
    }
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        if let url = Restoration.shared.url {
            let activity = NSUserActivity(activityType: "NIck.Hamster.Reddit")
            activity.addUserInfoEntries(from: [Restoration.shared.restorationKey : url])
            return activity
        }
        
        return nil
    }
}

