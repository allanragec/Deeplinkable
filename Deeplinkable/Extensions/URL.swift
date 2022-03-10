//
//  URL.swift
//  Deeplinkable
//
//  Created by Allan Melo on 08/03/22.
//

import Foundation

extension URL {
    var rawPath: String {
        guard let components = NSURLComponents(string: self.absoluteString) else {
            return self.absoluteString
        }
        components.query = nil
        
        return components.string ?? ""
    }
}
