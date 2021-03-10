//
//  AppDelegate.swift
//  Example
//
//  Created by Ben Shutt on 09/03/2021.
//

import UIKit
import HTTPRequest

/// `Dictionary` passed into the application on launch
typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?
    ) -> Bool {
        // Turn on HTTPRequest logging
        HTTPRequest.Configuration.shared.responseLogging = true

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the
        // new scene with.
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }
}
