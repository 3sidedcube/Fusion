//
//  LabelContainerView+Text.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation

extension LabelContainerView {

    /// Set the given `text`
    /// 
    /// - Parameter text: `Text`
    func setText(_ text: Text) {
        label.setText(text)

        // `padding`
        padding = text.padding?.insets ?? .zero

        // `margin`
        margin = text.margin?.insets ?? .zero
    }
}
