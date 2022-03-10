//
//  CGFloat.swift
//  Utils
//
//  Created by Allan Melo on 08/03/22.
//

import UIKit

public extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
