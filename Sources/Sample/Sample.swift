//
//  Sample.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

extension BulletGroupModel {

    static var sample: BulletGroupModel {
        return decode(.init(fileName: "bullets", extension: "json"))
    }
}

extension ButtonModel {

    static var sample: ButtonModel {
        return decode(.init(fileName: "button", extension: "json"))
    }
}

extension DividerModel {

    static var sample: DividerModel {
        return decode(.init(fileName: "divider", extension: "json"))
    }
}

extension ImageModel {

    static var sample: ImageModel {
        return decode(.init(fileName: "image", extension: "json"))
    }
}

extension ListItemModel {

    static var sample: ListItemModel {
        return decode(.init(fileName: "listItem", extension: "json"))
    }
}

extension TextModel {

    static var sample: TextModel {
        return decode(.init(fileName: "text", extension: "json"))
    }
}

// MARK: - Decode

/// Decode a `file` into a model `T` or fatal error
///
/// - Parameter file: `ProjectFile`
/// - Returns: `T`
private func decode<T>(_ file: ProjectFile) -> T where T: Decodable {
    do {
        return try ModelData.decode(file: file)
    } catch {
        fatalError("\(#function) \(error)")
    }
}
