//
//  ViewModel.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

/// Properties which apply on the view level.
/// All models which drive a view should share these properties and handle them accordingly
public protocol ViewModel {

    /// `RGBAHex` color of the background
    var backgroundColor: RGBAHex? { get }

    /// `Padding` of content insets
    var padding: InsetsModel? { get }

    /// `Margin` of insets relative to other views
    var margin: InsetsModel? { get }

    /// `Border` of the container
    var border: BorderModel? { get }

    /// `Shadow` of the container
    var shadow: ShadowModel? { get }

    /// Corner radius of the container
    var cornerRadius: Points? { get }
}
