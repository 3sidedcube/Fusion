//
//  Insettable.swift
//  Fusion
//
//  Created by Ben Shutt on 11/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// The entity supports both `Padding` and `Margins`.
///
/// This, ultimately, is to add support for `UIView`s which should behave like their Android equivalent.
/// For example, on an Android `TextView` `padding` and `margins` are properties to define inset.
public typealias Insettable = Padded & Margined
