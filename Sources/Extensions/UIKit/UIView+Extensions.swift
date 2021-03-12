//
//  UIView+Extensions.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    /// Remove all subviews in the subview hierarchy recursively
    func removeSubviewsRecursive() {
        for subview in subviews {
            subview.removeSubviewsRecursive()
            subview.removeFromSuperview()
        }
    }

    /// Set content `hugging` priority and content `compressionResistance` priority on the
    /// given `axis`
    ///
    /// - Parameters:
    ///   - hugging: `Float`
    ///   - compressionResistance: `Float`
    ///   - axis: `[NSLayoutConstraint.Axis]`
    func setContent(
        hugging: Float,
        compressionResistance: Float,
        axis: [NSLayoutConstraint.Axis]
    ) {
        axis.forEach {
            setContentHuggingPriority(
                .init(hugging),
                for: $0
            )
            setContentCompressionResistancePriority(
                .init(compressionResistance),
                for: $0
            )
        }
    }

    /// Return the first subview of type `T`.
    ///
    /// - Note:
    /// This function looks strictly at subviews so if `self` is a `T` then it will not be returned
    func firstSubviewOfType<T>() -> T? where T: UIView {
        return firstSubviewOfType(includeSelf: false)
    }

    /// Return the first subview of type `T`
    ///
    /// - Parameter includeSelf: `Bool` If `self` is of type `T` then `self` will be returned
    private func firstSubviewOfType<T>(includeSelf: Bool) -> T? where T: UIView {
        if includeSelf, let view = self as? T {
            return view
        }

        for subview in subviews {
            if let view: T = subview.firstSubviewOfType(includeSelf: true) {
                return view
            }
        }

        return nil
    }

    /// Get all `subviews` of type `T`
    func subviewsOfType<T>() -> [T] {
        var views = [T]()

        for subview in subviews {
            if let view = subview as? T {
                views.append(view)
            }
            views.append(contentsOf: subview.subviewsOfType())
        }

        return views
    }
}
