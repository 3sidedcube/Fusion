//
//  LabelContainerView.swift
//  Fusion
//
//  Created by Ben Shutt on 09/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `ContainerView` wrapping a `InsetLabel` subview.
open class LabelContainerView: ContainerView<InsetLabel> {

    open var label: InsetLabel {
        return subview
    }
}
