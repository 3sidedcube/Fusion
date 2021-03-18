//
//  LabelContainerView+Text.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

public extension LabelContainerView {

    /// Set the given `text`
    /// 
    /// - Parameter text: `Text`
    func setText(_ text: Text?) {
        // `TextProperties`
        label.setTextProperties(text)

        // `ViewModel`
        setViewModel(text)
    }
}
