//
//  ModelState.swift
//  Fusion
//
//  Created by Ben Shutt on 04/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A model or that model's ID.
///
/// Often a screen is created with either:
/// - the ID of the model (which might require fetching from the API)
/// - the model itself
///
/// So this enum is often used as a configuration/state of the screen
public enum ModelState<Id, Model> {

    /// The unique ID of the model
    case id(Id)

    /// The model itself
    case model(Model)
}
