//
//  InsetLabel.swift
//  Fusion
//
//  Created by Ben Shutt on 09/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// A `UILabel` where the drawn text can be inset
open class InsetLabel: UILabel, Padded {

    /// `UIEdgeInsets` to inset text
    public var insets: UIEdgeInsets = .zero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    // MARK: - View

    override open func layoutSubviews() {
        super.layoutSubviews()
        preferredMaxLayoutWidth = frame.width - (insets.left + insets.right)
    }

    override open func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: insets)
        super.drawText(in: insetRect)
    }

    override open var intrinsicContentSize: CGSize {
        return addInsets(to: super.intrinsicContentSize)
    }

    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return addInsets(to: super.sizeThatFits(size))
    }

    // MARK: - Inset

    /// Add `insets` to the given `size`
    ///
    /// - Parameter size: `CGSize`
    private func addInsets(to size: CGSize) -> CGSize {
        let width = size.width + insets.left + insets.right
        let height = size.height + insets.top + insets.bottom
        return CGSize(width: width, height: height)
    }

    // MARK: - Padded

    /// Get and set `Padding` by mapping from and to `insets`
    public var padding: Padding {
        get {
            return Padding(insets: insets)
        }
        set {
            insets = newValue.insets
        }
    }
}
