//
//  CardRow.swift
//  Example
//
//  Created by Ben Shutt on 15/03/2021.
//

import Foundation
import UIKit
import ThunderTable
import Fusion

/// `Row` which draws the UI for a `Card` model
class CardRow: FusionRow<CardTableViewCell> {

    /// `Card` model to drive UI
    private let card: Card

    /// `RemoteImage` for the `card`'s `image`
    private lazy var remoteImage: RemoteImage? = {
        guard let url = card.image?.toURL() else { return nil }
        return RemoteImage(url: url)
    }()

    // MARK: - Init

    /// Initialize with a `card`
    ///
    /// - Parameter card: `Card`
    init(card: Card) {
        self.card = card
    }

    // MARK: - Configure

    override func configureCell(
        _ cell: CardTableViewCell,
        at indexPath: IndexPath,
        in tableViewController: TableViewController
    ) {
        // `containerViews`
        cell.containerViews.forEach {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 16
            $0.layer.cornerCurve = .continuous
        }

        // `containerView`
        cell.containerView.clipsToBounds = false
        cell.containerView.layer.setSketchShadow(.init(
            color: .black, alpha: 0.2, x: 0, y: 2, blur: 8, spread: 0
        ))

        // `stackViewContainerView`
        cell.stackViewContainerView.clipsToBounds = true

        // `labels`
        cell.labels.forEach {
            $0.text = nil
            $0.backgroundColor = .clear
            $0.textColor = UIColor(
                red: 68 / 255, green: 68 / 255, blue: 68 / 255, alpha: 1
            )
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
        }

        // `titleLabel`
        cell.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        cell.titleLabel.text = card.title
        cell.titleLabel.isHidden = cell.titleLabel.text == nil
        cell.titleLabel.insets = UIEdgeInsets(
            top: 10, left: 15, bottom: 4, right: 15
        )

        // `subtitleLabel`
        cell.subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        cell.subtitleLabel.text = card.subtitle
        cell.subtitleLabel.isHidden = cell.subtitleLabel.text == nil
        cell.subtitleLabel.insets = UIEdgeInsets(
            top: 4, left: 15, bottom: 15, right: 15
        )

        // `cellImageView`
        cell.cellImageView.contentMode = .scaleAspectFit
        let imageBefore = remoteImage?.image
        cell.cellImageView?.loadRemoteImage(
            remoteImage
        ) { [weak self, weak tableViewController] _, _ in
            guard let self = self, self.remoteImage?.image != imageBefore else { return }
            (tableViewController as? RowUpdateListener)?.rowRequestedUpdate(self)
        }
    }
}
