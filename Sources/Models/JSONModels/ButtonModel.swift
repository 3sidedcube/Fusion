//
//  ButtonModel.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A `TextModel` with an action
///
/// - Note:
/// This structure is essentially the model to drive a SwiftUI `Button`
public struct ButtonModel: Codable, JSONModel, TextEntity, Actionable {

    /// `ActionJSON` on click
    public var action: ActionJSON?

    // MARK: - TextProperties

    /// Text content
    public var content: String?

    /// Color of the text
    public var textColor: RGBAHex?

    /// Font of the text
    public var font: FontModel?

    /// Alignment of the text
    public var textAlignment: TextAlignmentModel?

    /// Number of lines of text to draw
    public var numberOfLines: Int?

    /// Height of each line
    public var lineHeight: Points?

    /// Letter spacing between characters
    public var letterSpacing: Points?

    // MARK: - ViewModel

    /// `RGBAHex` background color
    public var backgroundColor: RGBAHex?

    /// `InsetsModel` padding insets
    public var padding: InsetsModel?

    /// `InsetsModel` margin insets
    public var margin: InsetsModel?

    /// `BorderModel`
    public var border: BorderModel?

    /// `ShadowModel`
    public var shadow: ShadowModel?

    /// `Points` of corner radius
    public var cornerRadius: Points?
}
