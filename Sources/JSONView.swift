//
//  JSONView.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct JSONView: View {

    enum Source {
        case json(JSON)
        case url(URL)
    }

    @StateObject private var viewModel: JSONViewModel

    init(url: URL) {
        self.init(source: .url(url))
    }

    init(source: Source) {
        _viewModel = .init(wrappedValue: JSONViewModel(source: source))
    }

    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .padding()
        } else if let json = viewModel.json {
            Fusion.shared.erasedView(for: json)
        }
    }
}

// MARK: - JSONViewModel

@MainActor private final class JSONViewModel: ObservableObject {

    @Published private(set) var json: JSON?
    @Published private(set) var isLoading = false

    init(source: JSONView.Source) {
        switch source {
        case let .json(json):
            self.json = json
        case let .url(url):
            Task {
                try await load(url: url)
            }
        }
    }

    func load(url: URL) async throws {
        isLoading = true
        defer { isLoading = false }
        json = try await JSON(url: url)
    }
}

// MARK: - JSONLoader

private extension JSON {

    init(url: URL) async throws {
        try self.init(data: Data(contentsOf: url))
    }
}
