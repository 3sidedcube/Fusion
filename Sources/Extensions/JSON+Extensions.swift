//
//  JSON+Hashable.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON

// MARK: - Hashable

extension JSON: Hashable {

    // TODO: Can we do this
    public func hash(into hasher: inout Hasher) {
        if let hashable = object as? any Hashable {
            hashable.hash(into: &hasher)
        } else {
            hasher.combine(rawString() ?? "")
        }
    }
}

// MARK: - JSONArray + View

extension JSONArray: View {

    @MainActor private var views: [AnyView]? {
        compactMap { json in
            guard let view = try? Fusion.shared.view(for: json) else { return nil }
            return AnyView(erasing: view)
        }
    }

    public var body: some View {
        if let views, !views.isEmpty {
            ForEach(
                Swift.Array(zip(views.indices, views)),
                id: \.0
            ) { _, view in
                view
            }
        } else {
            EmptyView()
        }
    }
}
