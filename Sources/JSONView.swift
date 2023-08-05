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
        case json(ModelJSON)
        case url(URL)
    }

    @StateObject private var viewModel: JSONViewModel

    init(source: Source) {
        _viewModel = .init(
            wrappedValue: JSONViewModel(source: source)
        )
    }

    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .padding()
        } else if let view = viewModel.view {
            view
        }
    }
}

// MARK: - Extensions

extension JSONView {

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

    var view: AnyView? {
        guard let json else { return nil }
        guard let view = try? Fusion.shared.view(for: json) else { return nil }
        return AnyView(erasing: view)
    }

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
        json = try await ModelJSON(url: url)
    }
}

// MARK: - JSONLoader

private extension ModelJSON {

    init(url: URL) async throws {
        try self.init(data: Data(contentsOf: url))
    }
}
