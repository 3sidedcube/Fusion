//
//  UIView+ViewModel.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation
import UIKit

extension UIView {

    /// Set the given `viewModel`
    ///
    /// - Parameter viewModel: `ViewModel`
    func setViewModel(_ viewModel: ViewModel) {
        // `backgroundColor`
        backgroundColor = viewModel.backgroundColor?.hexColor ?? .defaultBackgroundColor

        // Handle insets using `Insettable`
        if let viewToInset = self as? Insettable {
            // `padding`
            viewToInset.setPadding(viewModel.padding?.insets ?? .defaultPadding)

            // `margin`
            viewToInset.setMargin(viewModel.margin?.insets ?? .defaultMargin)
        }

        // `border`
        layer.setBorder(viewModel.border)

        // `shadow`
        layer.setShadow(viewModel.shadow)

        // `cornerRadius`
        layer.setCornerRadius(viewModel.cornerRadius)
    }
}
