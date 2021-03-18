//
//  ButtonContainerView+Button.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

public extension ButtonContainerView {

    /// Set the given `button`
    ///
    /// - Parameter button: `Button`
    func setButton(_ button: Button?) {
        // `TextProperties`
        self.button.setTextProperties(button)

        // `ViewModel`
        setViewModel(button)
    }
}
