//
//  SceneDelegate.swift
//  Example
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit
import Fusion

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = Self.rootViewController()
        window?.makeKeyAndVisible()
    }

    /// The root `UIViewController` of the app
    private static func rootViewController() -> UIViewController {
        return UINavigationController(
            rootViewController: PagesTableViewController()
        )
    }
}
