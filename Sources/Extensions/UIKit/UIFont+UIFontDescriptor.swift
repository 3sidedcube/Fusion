//
//  UIFont+UIFontDescriptor.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

extension UIFont {

    /// Add `traits` to `fontDescriptor`
    ///
    /// - Parameter traits: `[UIFontDescriptor.SymbolicTraits]`
    func addingTraits(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let symbolicTraits = UIFontDescriptor.SymbolicTraits(traits)
        let allTraits = fontDescriptor.symbolicTraits.union(symbolicTraits)
        let descriptor = fontDescriptor.withSymbolicTraits(allTraits)
        guard let fontDescriptor = descriptor else { return self }
        return UIFont(descriptor: fontDescriptor, size: 0)
    }

    /// Remove `traits` from `fontDescriptor`
    ///
    /// - Parameter traits: `[UIFontDescriptor.SymbolicTraits]`
    func removingTraits(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let symbolicTraits = UIFontDescriptor.SymbolicTraits(traits)
        let allTraits = fontDescriptor.symbolicTraits.subtracting(symbolicTraits)
        let descriptor = fontDescriptor.withSymbolicTraits(allTraits)
        guard let fontDescriptor = descriptor else { return self }
        return UIFont(descriptor: fontDescriptor, size: 0)
    }
}
