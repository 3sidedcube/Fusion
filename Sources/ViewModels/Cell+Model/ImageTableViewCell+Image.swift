//
//  ImageTableViewCell+Image.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

extension ImageTableViewCell {

    /// Set the given `image`
    ///
    /// - Parameter image: `Image`
    func setImage(_ image: Image) {
        // `src` handled in row

        // `backgroundColor`
        imageContainerView.backgroundColor = image.backgroundColor?.hexColor ?? .clear

        // `cornerRadius`
        imageContainerView.layer.cornerRadius = CGFloat(image.cornerRadius ?? 0)
        imageContainerView.layer.cornerCurve = .continuous

        // `shadow`
        if let shadow = image.shadow {
            imageContainerView.layer.setShadow(shadow)
        }

        // `border`
        if let border = image.border {
            imageContainerView.layer.setBorder(border)
        }

        // `padding`
        imageViewInsets = image.padding?.insets ?? .zero

        // `margin`
        imageContainerViewInsets = image.margin?.insets ?? .zero
    }
}
