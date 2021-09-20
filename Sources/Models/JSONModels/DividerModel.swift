//
//  DividerModel.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A structure used as a spacer or divider.
///
/// - Note:
/// This structure is essentially the model to drive a SwiftUI `Divider`
public struct DividerModel: Codable, JSONModel, ViewModel {

    /// Height of the divider
    public var strokeWidth: Points?

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

// MARK: - Extensions

extension DividerModel {

    /// Total height including `strokeWidth`, `padding`, `margin`
    var height: Points {
        let paddingHeight = padding?.insets.verticalSum ?? 0
        let marginsHeight = margin?.insets.verticalSum ?? 0
        let strokeWidth = self.strokeWidth ?? 0
        return max(0, strokeWidth + paddingHeight + marginsHeight)
    }
}
