//
//  ViewModel.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation

/// Properties which apply on the `UIView` level.
/// All models which drive a `UIView` should share these properties and handle them accordingly
public protocol ViewModel {

    /// `RGBAHex` color of the background
    var backgroundColor: RGBAHex? { get }

    /// `Padding` of content insets
    var padding: Padding? { get }

    /// `Margin` of insets relative to other views
    var margin: Margins? { get }

    /// `Border` of the container
    var border: Border? { get }

    /// `Shadow` of the container
    var shadow: Shadow? { get }

    /// Corner radius of the container
    var cornerRadius: Float? { get }
}
