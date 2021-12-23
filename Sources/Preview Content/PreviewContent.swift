//
//  PreviewContent.swift
//  Fusion
//
//  Created by Ben Shutt on 23/12/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Manage preview content
struct PreviewContent {

    /// Decode a new instance of `T`
    ///
    /// - Parameters:
    ///   - file: `ProjectFile`
    ///
    /// - Throws: File, data, or decoding error
    /// - Returns: `T`
    static func decode<T: Decodable>(file: ProjectFile) throws -> T {
        let url = try Bundle.main.urlOrThrow(for: file)
        let data = try Data(contentsOf: url)
        return try data.decode()
    }

    /// Load a `T` from a JSON file with the given `name` or fatal error.
    ///
    /// - Warning:
    /// Should only be used for preview contrent
    ///
    /// - Parameter name: `String` file name
    static func loadJson<T: Decodable>(name: String) -> T {
        do {
            return try decode(file: ProjectFile(
                fileName: name,
                fileExtension: "json"
            ))
        } catch {
            fatalError("\(#function)")
        }
    }
}

// MARK: - Instances

extension BulletGroupModel {

    static var sample: BulletGroupModel {
        return PreviewContent.loadJson(name: "bullets")
    }
}

extension ButtonModel {

    static var sample: ButtonModel {
        return PreviewContent.loadJson(name: "button")
    }
}

extension DividerModel {

    static var sample: DividerModel {
        return PreviewContent.loadJson(name: "divider")
    }
}

extension ImageModel {

    static var sample: ImageModel {
        return PreviewContent.loadJson(name: "image")
    }
}

extension ListItemModel {

    static var sample: ListItemModel {
        return PreviewContent.loadJson(name: "listItem")
    }
}

extension TextModel {

    static var sample: TextModel {
        return PreviewContent.loadJson(name: "text")
    }
}
