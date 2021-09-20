//
//  APIModel.swift
//  Fusion
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A model returned from the API
public struct APIModel<T>: Codable where T: Codable {

    /// An object `T` wrapped in `"data"`
    public var data: T
}
