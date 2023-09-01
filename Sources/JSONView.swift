//
//  JSONView.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON

/// A view rendered from Fusion JSON
public struct JSONView: View {

    /// Source of the JSON data
    public enum Source {

        /// Provide directly with the JSON
        case json(ModelJSON)

        /// Load the JSON from a URL
        case url(URL)
    }

    /// View model to load the JSON from the source
    @StateObject private var viewModel: JSONViewModel

    /// Initialize with the relevant `source`
    /// - Parameter source: `Source`
    fileprivate init(source: Source) {
        _viewModel = .init(
            wrappedValue: JSONViewModel(source: source)
        )
    }

    // MARK: - View

    public var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .padding()
        } else if let json = viewModel.json {
            (try? Fusion.shared.view(for: json))?.erased()
        }
    }
}

// MARK: - Extensions

public extension JSONView {

    init(url: URL) {
        self.init(source: .url(url))
    }

    init(json: ModelJSON) {
        self.init(source: .json(json))
    }
}

// MARK: - JSONViewModel

/// Load JSON from source
@MainActor private final class JSONViewModel: ObservableObject {

    /// The JSON when loaded, `nil` if loading or failed to load
    @Published private(set) var json: ModelJSON?

    /// Is the JSON being loaded
    @Published private(set) var isLoading = false

    /// Initialize with `source`
    /// - Parameter source: `JSONView.Source`
    init(source: JSONView.Source) {
        switch source {
        case let .json(json):
            self.json = json
        case let .url(url):
            loadTask(url: url)
        }
    }

    /// Create a new task to load the `url`
    /// - Parameter url: `URL`
    func loadTask(url: URL) {
        Task {
            do {
                try await load(url: url)
            } catch {
                Fusion.shared.log("Failed to load \(url) - \(error)")
            }
        }
    }

    /// Load from `url` asynchronously
    /// - Parameter url: `URL`
    func load(url: URL) async throws {
        isLoading = true
        defer { isLoading = false }
        json = try await ModelJSON(url: url)
    }
}

// MARK: - JSONLoader

private extension ModelJSON {

    /// Initialize JSON by loading the data at `url`
    /// - Parameter url: `URL`
    init(url: URL) async throws {
        try self.init(data: Data(contentsOf: url))
    }
}
