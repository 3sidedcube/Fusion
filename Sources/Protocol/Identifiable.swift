//
//  Identifiable.swift
//  CBIT
//
//  Created by Ben Shutt on 18/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An entity which is universally uniquely identified
public protocol Identifiable: Hashable {

    /// The universally unique identifier of entity
    var id: UUID { get }
}

// MARK: - Equatable

public extension Identifiable {

    /// Check `equatable` implementation on `id`
    ///
    /// - Parameters:
    ///   - lhs: `Self`
    ///   - rhs: `Self`
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Hashable

public extension Identifiable {

    /// Add `id` to `hasher`
    /// 
    /// - Parameter hasher: `Hasher`
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Array + Identifiable

public extension Array where Element: Identifiable {

    /// `first` where the `Element` has the given `id`
    ///
    /// - Parameter id: `UUID` to compare with the `Identifiable` `id`
    func first(for id: UUID) -> Element? {
        return first { $0.id == id }
    }

    /// `firstIndex` where the `Element` has the given `id`
    ///
    /// - Parameter id: `UUID` to compare with the `Identifiable` `id`
    func firstIndex(for id: UUID) -> Int? {
        return firstIndex { $0.id == id }
    }

    /// `contains` where the `Element` has the given `id`
    ///
    /// - Parameter id: `UUID` to compare with the `Identifiable` `id`
    func contains(with id: UUID) -> Bool {
        return contains { $0.id == id }
    }
}
