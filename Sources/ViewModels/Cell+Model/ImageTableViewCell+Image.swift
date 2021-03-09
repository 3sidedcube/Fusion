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
    /// - Parameters:
    ///   - image: `Image`
    ///   - completion: `ImageCompletion`
    func setImage(_ image: inout Image, completion: ImageCompletion?) {
        imageContainerView.setImage(&image, completion: completion)

        // `margin`
        imageContainerViewInsets = image.margin?.insets ?? .zero
    }
}
