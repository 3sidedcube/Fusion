//
//  UIImage+Extensions.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    /// Resize this `UIImage` instance to the given `size`
    ///
    /// - Parameter size: `CGSize`
    func resizeImage(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }

    /// Given a fixed `targetWidth`, get the target height by scaling proportionally
    /// to the aspect ratio of `self`
    ///
    /// - Parameter targetWidth: `CGFloat` width to force
    func imageHeight(for targetWidth: CGFloat) -> CGFloat {
        return size.height(for: targetWidth)
    }
}

// MARK: - CGSize + Extensions

extension CGSize {

    /// Given a fixed `targetWidth`, get the target height by scaling proportionally
    /// to the aspect ratio of `self`
    ///
    /// - Parameter targetWidth: `CGFloat` width to force
    func height(for targetWidth: CGFloat) -> CGFloat {
        let width = self.width
        let height = self.height
        guard width > 0 else { return 0 }
        let targetHeight = targetWidth * height / width
        return targetHeight
    }
}
