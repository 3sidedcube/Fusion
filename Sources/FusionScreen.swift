//
//  FusionScreen.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON

// TODO: Doesn't need to be a screen

struct FusionScreen: View {

    @StateObject private var source = FusionSource()

    var body: some View {
        if source.isLoading {
            ProgressView()
        } else if let json = source.json {
            AnyView(erasing: Fusion.shared.view(for: json))
        }
    }
}

@MainActor final class FusionSource: ObservableObject {

    @Published private(set) var json: JSON?
    @Published private(set) var isLoading = false

    func load(json: JSON) {
        self.json = json
    }

    func load(url: URL) async {
        isLoading = true
        defer { isLoading = false }

        do {
            json = try await JSONLoader.load(url: url)
        } catch {
            print("Failed to load \(JSON.self) at \(url)")
        }
    }
}

// MARK: - JSONLoader

private struct JSONLoader {

    static func load(url: URL) async throws -> JSON {
        try JSON(data: Data(contentsOf: url))
    }
}
