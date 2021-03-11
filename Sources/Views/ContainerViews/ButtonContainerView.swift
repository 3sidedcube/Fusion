//
//  ButtonContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

/// Container of a `UIButton`.
///
/// For Android compatibility, this `UIView` can set both
/// - `padding` (inset of own content)
/// - `margin` (inset relative to other views)
class ButtonContainerView: UIView, Insettable {

    /// Set the `UIEdgeInsets` of `buttonConstraints`
    var margin: UIEdgeInsets {
        get {
            return buttonConstraints.insets
        }
        set {
            buttonConstraints.insets = newValue
        }
    }

    /// Set the `UIEdgeInsets` of `button`
    var padding: UIEdgeInsets {
        get {
            return button.contentEdgeInsets
        }
        set {
            button.contentEdgeInsets = newValue
        }
    }

    /// `UIButton` to draw text
    let button = UIButton()

    /// `EdgeConstraints` of `button`
    private(set) var buttonConstraints: EdgeConstraints!

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
        addSubview(button)
    }

    /// Add constraints to subviews in the subview hierarchy
    private func addConstraints() {
        buttonConstraints = button.edgeConstraints(to: self)
    }

    // MARK: - Insettable

    func setPadding(_ padding: UIEdgeInsets) {
        self.padding = padding
    }

    func setMargin(_ margin: UIEdgeInsets) {
        self.margin = margin
    }
}
