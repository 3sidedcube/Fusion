//
//  AppDelegate.swift
//  Example
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import UIKit
import HTTPRequest
import Fusion

/// `Dictionary` passed into the application on launch
typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?
    ) -> Bool {
        // Configure HTTPRequest logging
        HTTPRequest.Configuration.shared.logging = false

        // Set `Fusion` singleton instance
        Fusion.shared = AppFusion()

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
