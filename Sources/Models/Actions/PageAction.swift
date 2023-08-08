//
//  PageAction.swift
//  Fusion
//
//  Created by Ben Shutt on 05/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// An action model which opens another Fusion page
public struct PageAction: FusionAction {

    public var url: URL

    // MARK: - Init

    public init(url: URL) {
        self.url = url
    }

    // MARK: - FusionAction

    public func body(content: Content) -> some View {
        NavigationLink(value: self) {
            content
        }
    }

    public func navigationDestination() -> some View {
        JSONView(url: url)
    }
}
