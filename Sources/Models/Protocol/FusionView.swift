//
//  FusionView.swift
//  Fusion
//
//  Created by Ben Shutt on 28/10/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

protocol FusionView {

    func toView() -> AnyView?
}

extension FusionView where Self: View {

    func toView() -> AnyView? {
        return AnyView(body)
    }
}

extension FusionView {

    func toView() -> AnyView? {
        return nil
    }
}
