//
//  TextEntity.swift
//  Fusion
//
//  Created by Ben Shutt on 12/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Properties which define how to draw text
public protocol TextEntity: ViewModel, FusionView {

    /// Text content
    var content: String? { get }

    /// Color of the text
    var textColor: RGBAHex? { get }

    /// Font of the text
    var font: FontModel? { get }

    /// Alignment of the text
    var textAlignment: TextAlignmentModel? { get }

    /// Number of lines of text to draw
    var numberOfLines: Int? { get }

    /// Height of each line
    var lineHeight: Points? { get }

    /// Letter spacing between characters
    var letterSpacing: Points? { get }
}
