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

    /// Set the given `padding`
    ///
    /// - Parameter padding: `UIEdgeInsets`
    func setPadding(_ padding: UIEdgeInsets)

    /// Set the given `margin`
    ///
    /// - Parameter margin: `UIEdgeInsets`
    func setMargin(_ margin: UIEdgeInsets)
}
