//
//  ButtonTableViewCell+Button.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation

extension ButtonTableViewCell {

    /// Set the given `button`
    ///
    /// - Parameter button: `Button`
    func setButton(_ button: Button) {
        buttonContainerView.setButton(button)
    }
}
