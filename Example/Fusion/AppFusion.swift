//
//  AppFusion.swift
//  Example
//
//  Created by Ben Shutt on 15/03/2021.
//

import Foundation
import UIKit
import Fusion

class AppFusion: Fusion {

    override var jsonModelTypes: [JSONModel.Type] {
        return super.jsonModelTypes + [Card.self]
    }

    /*
    override func rowDidConfigure<T>(_ row: FusionRow<T>) where T : UITableViewCell {
        if let row = row as? BulletRow {
            
        }
    }

    // MARK: - Configure

    /// Provide app specific customization to `bulletRow`
    ///
    /// - Parameter bulletRow: `BulletRow`
    func configureBulletRow(_ bulletRow: BulletRow) {

    }*/
}
