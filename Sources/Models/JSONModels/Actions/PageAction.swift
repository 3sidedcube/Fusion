//
//  ArticleAction.swift
//  CBIT
//
//  Created by Ben Shutt on 12/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// An `Action` to push a (CMS) data driven page.
struct PageAction: Codable, Action {

    /// `Link`
    var link: Link?
}
