//
//  ListItemView.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftUI

extension ListItemModel: ListItemView {

    var leading: ImageModel? {
        return image
    }
}

// MARK: - PreviewProvider

struct ListItemModel_Previews: PreviewProvider {
    static var previews: some View {
        ListItemModel.sample
    }
}
