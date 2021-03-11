//
//  LabelContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// Container of a `InsetLabel`.
///
/// For Android compatibility, this `UIView` can set both
/// - `padding` (inset of own content)
/// - `margin` (inset relative to other views)
class LabelContainerView: UIView, Insettable {

    /// Set the `UIEdgeInsets` of `labelEdgeConstraints`
    var margin: UIEdgeInsets {
        get {
            return labelEdgeConstraints.insets
        }
        set {
            labelEdgeConstraints.insets = newValue
        }
    }

    /// Set the `UIEdgeInsets` of `label`
    var padding: UIEdgeInsets {
        get {
            return label.insets
        }
        set {
            label.insets = newValue
        }
    }

    /// `InsetLabel` to draw text
    let label: InsetLabel = {
        let label = InsetLabel()
        label.setDefaults()
        return label
    }()

    /// `EdgeConstraints` of `label`
    private(set) var labelEdgeConstraints: EdgeConstraints!

    // MARK: - Init

    convenience init() {
        self.init(frame: .zero)
    }

    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    /// Shared initializer functionality
    private func setup() {
        backgroundColor = .clear

        addSubviews()
        addConstraints()
    }

    // MARK: - Subviews and Constraints

    /// Add subviews to subview hierarchy
    private func addSubviews() {
        addSubview(label)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        labelEdgeConstraints = label.edgeConstraints(to: self)
    }

    // MARK: - Insettable

    func setPadding(_ padding: UIEdgeInsets) {
        self.padding = padding
    }

    func setMargin(_ margin: UIEdgeInsets) {
        self.margin = margin
    }
}
