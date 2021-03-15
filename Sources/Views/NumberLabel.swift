//
//  NumberLabel.swift
//  CBIT
//
//  Created by Ben Shutt on 07/12/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit

/// `UILabel` used in the app for showing a number
class NumberLabel: InsetLabel {

    // MARK: - Init

    convenience init() {
        self.init(frame: .zero)
    }

    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        setDefaults()

        numberOfLines = 1
        textAlignment = .center
        clipsToBounds = true
        insets = UIEdgeInsets(value: 10)

        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()

        let size = min(bounds.width, bounds.height)
        layer.cornerRadius = size * 0.5
    }
}
