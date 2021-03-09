//
//  SceneDelegate.swift
//  Example
//
//  Created by Ben Shutt on 09/03/2021.
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
        do {
            let pageURL = try PageId.sample.toURL()
            return PageViewController(pageURL: pageURL)
        } catch {
            fatalError("Failed to create rootViewController: \(error)")
        }
    }
}
