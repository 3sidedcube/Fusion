//
//  EmailViewControllerRepresentable.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI
import MessageUI

/// `UIViewControllerRepresentable` for presenting `MFMailComposeViewController`
struct EmailViewControllerRepresentable: UIViewControllerRepresentable {

    /// `Email` model
    var email: Email

    // MARK: - UIViewControllerRepresentable

    func updateUIViewController(
        _ uiViewController: MFMailComposeViewController,
        context: Context
    ) {
        // Do nothing
    }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        return .mailCompose(email: email)
    }
}
