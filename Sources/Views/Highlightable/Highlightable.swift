//
//  Highlightable.swift
//  CBIT
//
//  Created by Ben Shutt on 19/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable

/// A protocol which allows anything to be "highlighted"
protocol Highlightable: AnyObject {

    /// Update `highlighted` state
    ///
    /// - Parameters:
    ///   - highlighted: `Bool` highlighted state
    ///   - animated: `Bool` Should animate
    func setHighlighted(_ highlighted: Bool, animated: Bool)
}

// MARK: - UITableViewCell + Highlightable

extension UITableViewCell: Highlightable {

    func updateHighlighted(animated: Bool) {
        setHighlighted(isHighlighted, animated: animated)
    }
}
