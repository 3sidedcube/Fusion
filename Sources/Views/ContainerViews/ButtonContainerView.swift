//
//  ButtonContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 10/03/2021.
//

import Foundation
import UIKit

/// `ContainerView` wrapping a `UIButton` subview.
class ButtonContainerView: ContainerView<UIButton> {

    var button: UIButton {
        return subview
    }
}
