//
//  Result+CMSObject.swift
//  CBIT
//
//  Created by Ben Shutt on 05/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import HTTPRequest

/// Often the server returns a `Codable` wrapped in a `CMSObject`.
/// These are helper methods to work around that `CMSObject`.
extension Result where Success == Data {

    /// Parse `self` as a `CMSObject` result where the `Success` is of type `T`.
    /// Execute the appropriate closure based on the `Result` state.
    ///
    /// - Parameters:
    ///   - success: Closure to execute on `.success` state
    ///   - failure: Closure to execute on `.failure` state
    func onSuccess<T>(
        _ success: (T) -> Void,
        onFailure failure: (Error) -> Void
    ) where T: Model {
        let result: Result<CMSObject<T>, Error> = modelResult()
        switch result {
        case .success(let object):
            success(object.data)
        case .failure(let error):
            failure(error)
        }
    }

    /// Execute `model()` as a `CMSObject` and return its `data`
    func cmsObjectModel<T>() -> T? where T: Model {
        let object: CMSObject<T>? = model()
        return object?.data
    }

    /// Try read `.success` into a `CMSObject` wrapping `T`.
    /// On success, return its `data`.
    func cmsObjectModelOrThrow<T>() throws -> T where T: Model {
        let object: CMSObject<T> = try modelResult().successOrThrow()
        return object.data
    }
}
