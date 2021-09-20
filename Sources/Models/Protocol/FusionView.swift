//
//  FusionView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

/// A model which defines a view
public protocol FusionView: JSONModel {
    associatedtype Body: View

    @ViewBuilder
    func body(actionHandler: ActionHandler?) -> Body
}
