//
//  TextTableViewCell+Text.swift
//  Fusion
//
//  Created by Ben Shutt on 08/03/2021.
//

import Foundation

extension TextTableViewCell {

    /// Set the given `text`
    ///
    /// - Parameter text: `Text`
    func setText(_ text: Text) {
        label.setText(text)

        // `margin`
        labelInsets = text.margin?.insets ?? .zero
    }
}
