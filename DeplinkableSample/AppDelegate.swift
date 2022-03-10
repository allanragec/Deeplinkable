//
//  AppDelegate.swift
//  DeplinkableSample
//
//  Created by Allan Melo on 07/03/22.
//

import UIKit
import Deeplinkable

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DeeplinkRouter.setup(shouldLogIndexedDeeplinks: true)
        return true
    }
}

