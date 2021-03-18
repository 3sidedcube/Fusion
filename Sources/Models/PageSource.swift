//
//  PageSource.swift
//  Fusion
//
//  Created by Ben Shutt on 04/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Source for fetching a `Page`
public enum PageSource {

    /// Instantiate with the `UUID` of the `Page` to fetch.
    case pageId(UUID)

    /// `URL` to fetch a `Page` model.
    case pageURL(URL)
}
