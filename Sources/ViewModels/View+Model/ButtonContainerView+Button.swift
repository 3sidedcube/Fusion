//
//  ButtonContainerView+Button.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

extension ButtonContainerView {

    /// Set the given `button`
    ///
    /// - Parameter button: `Button`
    func setButton(_ button: Button) {
        if let text = button.text {
            self.button.titleLabel?.setText(text)
        }

        // Override `backgroundColor`
        self.button.titleLabel?.backgroundColor = .clear
        self.button.backgroundColor =
            button.text?.backgroundColor?.hexColor ?? .defaultBackgroundColor

        // `padding`
        padding = button.text?.padding?.insets ?? .zero

        // `margin`
        margin = button.text?.margin?.insets ?? .zero

        // `border`
        self.button.layer.setBorder(button.text?.border)

        // TODO
    }
}
