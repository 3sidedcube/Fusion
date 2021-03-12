//
//  ButtonContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

/// The given `UIButton` sent its target an action
typealias ButtonAction = (UIButton) -> Void

/// `ContainerView` wrapping a `UIButton` subview.
class ButtonContainerView: ContainerView<UIButton> {

    /// Set the `ButtonAction`
    var onButtonTouchUpInside: ButtonAction?

    /// Shorthand to `subview` where `subview` is a `UIButton`
    var button: UIButton {
        return subview
    }

    /// Create the `UIButton` instance
    override func createSubview() -> UIButton {
        let button = UIButton(type: .system)
        button.addTarget(
            self,
            action: #selector(buttonTouchUpInside),
            for: .touchUpInside
        )
        return button
    }

    // MARK: - Action

    /// Remove all targets and actions on `button`
    func removeButtonTargetActions() {
        button.removeTarget(nil, action: nil, for: .allEvents)
    }

    /// `UIButton` method for the `.touchUpInside` `UIControl.Event`
    ///
    /// - Parameter sender: `UIButton`
    @objc
    private func buttonTouchUpInside(_ sender: UIButton) {
        onButtonTouchUpInside?(sender)
    }
}
