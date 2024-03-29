//
//  JSON+Hashable.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON

// MARK: - JSON + Encodable

public extension JSON {

    init(
        encoding models: [any Encodable],
        with jsonEncoder: JSONEncoder = JSONEncoder()
    ) throws {
        self = try JSON(models.map {
            try JSON(encoding: $0, with: jsonEncoder)
        })
    }

    init(
        encoding model: some Encodable,
        with jsonEncoder: JSONEncoder = JSONEncoder()
    ) throws {
        try self.init(data: jsonEncoder.encode(model))
    }
}


// MARK: - JSON + Hashable

extension JSON: Hashable {

    // TODO: Can we do this?
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

    @MainActor private var views: [some View]? {
        compactMap { json in
            (try? Fusion.shared.view(for: json))?.erased()
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
