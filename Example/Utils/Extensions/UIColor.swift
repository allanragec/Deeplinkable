//
//  UIColor.swift
//  Utils
//
//  Created by Allan Melo on 08/03/22.
//

import UIKit

public extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
