//
//  SwiftUIView.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

/// An action model which opens a `URL`
public struct LinkAction: FusionAction {

    public var url: URL
    public var inApp: Bool?

    // MARK: - Init

    public init(url: URL, inApp: Bool? = nil) {
        self.url = url
        self.inApp = inApp
    }

    // MARK: - Computed

    private var isSafari: Bool {
        inApp ?? .defaultLinkInApp
    }

    // MARK: - FusionAction

    public func body(content: Content) -> some View {
        if isSafari {
            NavigationLink(value: self) {
                content
            }
        } else {
            Button(action: {
                UIApplication.shared.open(url) { isSuccess in
                    guard !isSuccess else { return }
                    Fusion.shared.log("Failed to open URL: \(url)")
                }
            }, label: {
                content
            })
        }
    }

    public func navigationDestination() -> some View {
        SafariView(url: url)
    }
}
