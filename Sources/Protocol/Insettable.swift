//
//  Insettable.swift
//  Fusion
//
//  Created by Ben Shutt on 06/03/2021.
//

import Foundation
import UIKit

/// An entity which can be inset with `UIEdgeInsets`
public protocol Insettable {

    /// Set the given `insets`
    ///
    /// - Parameter insets: `UIEdgeInsets`
    func setInsets(_ insets: UIEdgeInsets)
}
