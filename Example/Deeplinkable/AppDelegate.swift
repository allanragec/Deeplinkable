//
//  AppDelegate.swift
//  Deeplinkable
//
//  Created by Allan Melo on 03/09/2022.
//  Copyright (c) 2022 Allan Melo. All rights reserved.
//

import UIKit
import Deeplinkable

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DeeplinkRouter.setup(shouldLogIndexedDeeplinks: true)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        DeeplinkRouter.open(url)
    }
}

