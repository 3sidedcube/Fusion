//
//  PageView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftyJSON

extension Page: View {

    public var body: some View {
        let views = jsonModels.compactMap { Fusion.shared.view(for: $0) }
        return List {
            ForEach(0 ..< views.count) { index in
                views[index]
            }
        }
    }
}

// MARK: - Page + JSONModel

private extension Page {

    /// Get `JSONModel` components
    /// 
    /// Take all items which are non-nil `JSONModel`s
    var jsonModels: [JSONModel] {
        guard let children = screen?.children.array else { return [] }
        return children.compactMap { try? $0.toJSONModel() }
    }
}

// MARK: - PreviewProvider

struct Page_Previews: PreviewProvider {
    static var previews: some View {
        Page(
            id: UUID(),
            title: nil,
            date: Date(),
            lastModified: nil,
            slug: nil,
            backgroundColor: nil,
            screen: Screen(children: JSON([
                ButtonModel.sample // TODO
            ])),
            apiUrl: nil,
            analyticsScreenView: nil
        )
    }
}
