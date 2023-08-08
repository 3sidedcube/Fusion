//
//  JSONView.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON

public struct JSONView: View {

    public enum Source {
        case json(ModelJSON)
        case url(URL)
    }

    @StateObject private var viewModel: JSONViewModel

    public init(source: Source) {
        _viewModel = .init(
            wrappedValue: JSONViewModel(source: source)
        )
    }

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

@MainActor private final class JSONViewModel: ObservableObject {

    @Published private(set) var json: ModelJSON?
    @Published private(set) var isLoading = false

    init(source: JSONView.Source) {
        switch source {
        case let .json(json):
            self.json = json
        case let .url(url):
            Task {
                do {
                    try await load(url: url)
                } catch {
                    Fusion.shared.log("Failed to load \(url) - \(error)")
                }
            }
        }
    }

    func load(url: URL) async throws {
        isLoading = true
        defer { isLoading = false }
        json = try await ModelJSON(url: url)
    }
}

// MARK: - JSONLoader

private extension ModelJSON {

    init(url: URL) async throws {
        try self.init(data: Data(contentsOf: url))
    }
}
