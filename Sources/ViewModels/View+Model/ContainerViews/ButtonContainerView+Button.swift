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
        self.button.titleLabel?.setText(button?.text, setViewProperties: false)
        setViewModel(button?.text)
    }
}
