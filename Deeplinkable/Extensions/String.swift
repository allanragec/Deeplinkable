//
//  String.swift
//  Deeplinkable
//
//  Created by Allan Melo on 08/03/22.
//

import Foundation

extension String {
    func isValidForRegex(_ pattern: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self)
    }
}
