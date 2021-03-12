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
    func setButton(_ button: Button?) {
        // `TextProperties`
        self.button.setAttributedTitle(button?.attributedString, for: .normal)
        self.button.titleLabel?.numberOfLines =
            button?.numberOfLines ?? .defaultNumberOfLines

        // `view-model`
        setViewModel(button)
    }
}
