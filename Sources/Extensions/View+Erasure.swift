//
//  View+Erasure.swift
//  Fusion
//
//  Created by Ben Shutt on 07/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

extension View {

    /// Erase this instance to `AnyView`
    /// - Returns: `AnyView`
    func erased() -> AnyView {
        AnyView(erasing: self)
    }

    /// Modify this instance with the given `action`
    /// - Parameter action: `ViewModifier`
    /// - Returns: `View`
    func modify(with action: some ViewModifier) -> some View {
        modifier(action)
    }
}
