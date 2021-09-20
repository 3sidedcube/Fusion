//
//  SketchShadow+ViewModifier.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension SketchShadow: ViewModifier {

    // TODO: Spread not used
    public func body(content: Content) -> some View {
        content.shadow(color: color, radius: blur * 0.5, x: x, y: y)
    }
}

extension View {

    func sketchShadow(_ sketchShadow: SketchShadow) -> some View {
        modifier(sketchShadow)
    }
}
