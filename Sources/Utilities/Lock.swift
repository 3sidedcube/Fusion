//
//  Lock.swift
//  CBIT
//
//  Created by Ben Shutt on 20/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An `Element` where the setter can be locked.
/// For example, in a `didSet`, is should only apply when in a particular state
struct Lock<Element> {

    /// `Element` where the
    private(set) var element: Element

    /// Whether `element` is locked
    private(set) var isLocked: Bool

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - element: `Element`
    ///   - isLocked: `Bool`
    init(element: Element, isLocked: Bool = false) {
        self.element = element
        self.isLocked = isLocked
    }

    /// Lock `element`
    mutating func lock() {
        isLocked = true
    }

    /// Unlock `element`
    mutating func unlock() {
        isLocked = false
    }

    /// Set `self.element` to the given `element` if it is not locked
    ///
    /// - Parameter element: `Element` to set `element` to
    mutating func setElement(_ element: Element) {
        guard !isLocked else { return }
        self.element = element
    }
}
