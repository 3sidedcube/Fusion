//
//  ActionHandler.swift
//  CBIT
//
//  Created by Ben Shutt on 13/01/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An entity which can be passed an `Action` to invoke functionality
public protocol ActionHandler: AnyObject {

    /// Handle the given `action`
    ///
    /// - Parameter action: `Action`
    @discardableResult
    func handleAction(_ action: Action) -> Bool
}
