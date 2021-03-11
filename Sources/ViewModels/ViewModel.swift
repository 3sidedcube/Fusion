//
//  ViewModel.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//

import Foundation

/// Properties which apply on the `UIView` level.
/// All models which drives `UIView`s should share these properties and handle them accordingly
protocol ViewModel {

    /// `RGBAHex` color for the background
    var backgroundColor: RGBAHex? { get }

    /// `Padding` for content insets
    var padding: Padding? { get }

    /// `Margin` for insets relative to other views
    var margin: Margin? { get }

    /// `Border` of the container
    var border: Border? { get }

    /// `Shadow` of the container
    var shadow: Shadow? { get }

    /// Corner radius of the container
    var cornerRadius: Float? { get }
}
