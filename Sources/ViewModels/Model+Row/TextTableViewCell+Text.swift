//
//  TextTableViewCell+Text.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

extension TextTableViewCell {

    /// Set `Text` on this instance
    /// - Parameter text: `Text`
    func setText(_ text: Text) {
        label.setText(text)

        // Handle `margin`
        labelInsets = text.margin?.insets ?? .zero
    }
}
