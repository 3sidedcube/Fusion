//
//  PagesTableViewController.swift
//  Example
//
//  Created by Ben Shutt on 13/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import ThunderTable
import Fusion
import Alamofire
import HTTPRequest

/// List Pages on the CMS
class PagesTableViewController: BaseTableViewController {

    /// CMS driven `Page`s to fetch from server
    private var pages: [Page] = [] {
        didSet {
            redraw()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        redraw()
        refresh()
    }

    // MARK: - Redraw

    /// Redraw `tableView` UI
    override func redraw() {
        data = pages.map { page in
            TableSection(rows: [
                TableRow(title: page.title) { [weak self] _, _, _, _ in
                    self?.push(page: page)
                }
            ])
        }
    }

    /// Fetch `pages` from server
    private func refresh() {
        let httpRequest = HTTPRequest(
            method: .get,
            urlComponents: .statamicAPI(endpoint: "collections/articles/entries")
        )

        beginRefreshing()
        AF.request(httpRequest) { [weak self] result in
            self?.endRefreshing()
            self?.pages = (try? result.cmsObjectOrThrow().data) ?? []
        }
    }

    // MARK: - Action

    /// Push the given `page`
    ///
    /// - Parameter page: `Page`
    private func push(page: Page) {
        guard let apiURL = page.apiUrl else { return }
        guard let pageURL = URL(string: apiURL) else { return }
        let viewController = PageViewController(pageURL: pageURL)
        viewController.pullToRefresh = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
