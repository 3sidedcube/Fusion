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
    func setText(_ text: Text?) {
        // `TextProperties`
        label.text = nil
        label.setDefaults()
        label.attributedText = text?.attributedString
        self.label.numberOfLines = text?.numberOfLines ?? .defaultNumberOfLines

        // `view-model`
        setViewModel(text)
    }
}
