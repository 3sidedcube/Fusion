//
//  FusionTextStyle.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

public struct FusionTextStyle: Model, ViewModifier {

    public var name: String?
    public var size: CGFloat?
    public var weight: Int?
    public var lineHeight: CGFloat?
    public var letterSpacing: CGFloat?

    // MARK: - Init

    public init(
        name: String? = nil,
        size: CGFloat? = nil,
        weight: Int? = nil,
        lineHeight: CGFloat? = nil,
        letterSpacing: CGFloat? = nil
    ) {
        self.name = name
        self.size = size
        self.weight = weight
        self.lineHeight = lineHeight
        self.letterSpacing = letterSpacing
    }

    // MARK: - Computed

    private var fontName: Font.Name {
        guard let fontName = name else { return .default }
        return .custom(fontName)
    }

    // MARK: - ViewModifier

    public func body(content: Content) -> some View {
        content.style(TextStyle(
            fontName,
            weight: .init(integer: weight ?? .defaultFontWeight),
            size: size ?? .defaultFontSize,
            lineHeight: lineHeight ?? size ?? .defaultFontSize, // TODO
            letter: letterSpacing ?? .defaultLetterSpacing,
            underline: false
        ))
    }
}

// MARK: - View + Extensions

public extension View {

    func textStyle(_ textStyle: FusionTextStyle?) -> some View {
        modifier(textStyle ?? FusionTextStyle())
    }
}
