//
//  ListItemView2.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

/// Protocol sharing `ListItemModel` view
protocol ListItemView: ViewModel, View {
    associatedtype LeadingView: View

    /// `LeadingView`
    var leading: LeadingView? { get }

    /// `TextModel` of the title
    var title: TextModel? { get }

    /// `TextModel` of the subtitle
    var subtitle: TextModel? { get }

    /// `Points` spacing between `title` and `subtitle` views
    var textSpacing: Points? { get }

    /// `Points` spacing between `bullet` and text views
    var imageSpacing: Points? { get }
}

// MARK: - Defaults

extension ListItemView {

    /// `imageSpacing` or default
    var imageSpacingOrDefault: Points {
        return imageSpacing ?? .defaultImageSpacing
    }

    /// `textSpacing` or default
    private var textSpacingOrDefault: Points {
        return textSpacing ?? .defaultTextSpacing
    }
}

// MARK: - FusionView

extension ListItemView {

    public var body: some View {
        HStack {
            if let leading = leading {
                leading
            }
            Spacer()
                .frame(idealWidth: imageSpacingOrDefault)
            VStack {
                if let title = title {
                    title
                }
                Spacer()
                    .frame(idealHeight: textSpacingOrDefault)
                if let subtitle = subtitle {
                    subtitle
                }
            }
        }
        .viewModel(self)
    }
}
