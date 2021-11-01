//
//  BulletView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension BulletModel: ListItemView {

    var leading: TextModel? {
        return bullet
    }
}

// MARK: - PreviewProvider

struct BulletModel_Previews: PreviewProvider {
    static var previews: some View {
        BulletGroupModel.sample.children[0]
    }
}
