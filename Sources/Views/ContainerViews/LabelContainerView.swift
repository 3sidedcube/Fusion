//
//  LabelContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//

import Foundation
import UIKit

/// `ContainerView` wrapping a `InsetLabel` subview.
class LabelContainerView: ContainerView<InsetLabel> {

    var label: InsetLabel {
        return subview
    }
}
