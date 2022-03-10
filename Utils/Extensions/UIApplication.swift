//
//  UIApplication.swift
//  Utils
//
//  Created by Allan Melo on 08/03/22.
//

import UIKit

public extension UIApplication {
    var currentWindow: UIWindow? {
        connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }
    
    var rootNavigation: UINavigationController? {
        currentWindow?.rootViewController as? UINavigationController
    }
}
