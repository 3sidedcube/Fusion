//
//  Result+CMSObject.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import HTTPRequest

public extension Result where Success == Data {

    /// Get the associated `Data` if the result is a success otherwise throw.
    /// Decode that `Data` into a `CMSObject<T>` where `T` is a `Decodable`
    func cmsObjectOrThrow<T>() throws -> CMSObject<T> where T: Decodable {
        let data = try successOrThrow()
        let decoder = Fusion.shared.jsonDecoder
        return try decoder.decode(CMSObject<T>.self, from: data)
    }
}
