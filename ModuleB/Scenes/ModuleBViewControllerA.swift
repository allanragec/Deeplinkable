//
//  ModuleBViewControllerA.swift
//  ModuleB
//
//  Created by Allan Melo on 07/03/22.
//

import UIKit
import Utils
import Deeplinkable

class ModuleBViewControllerA: UIViewController {
    public override func viewDidLoad() {
        view.backgroundColor = .random()
        self.title = self.description
        addLabelName(text: "ViewController with static path")
        addLabelName(text: ModuleBViewControllerA.deeplinkPath)
        
        addButton(text: "Close") { [weak self] _ in
            self?.navigationController?.dismiss(animated: true)
        }
    }
}

extension ModuleBViewControllerA: Deeplinkable {
    static var isDynamicPath: Bool {
        false
    }
    
    public static var deeplinkPath: String {
        // Here you define your deeplink path
        "deeplinksample://moduleb/viewcontrollera"
    }
    
    public static func open(url: URL) -> Bool {
        // Here you define if/how you will handle your deeplink
        // Open in modal style
        // Open with push
        guard let navigation = UIApplication.shared.rootNavigation else {
            return false
        }
        
        let flowNavigation = UINavigationController(rootViewController: ModuleBViewControllerA())
        navigation.present(flowNavigation, animated: true)
        return true
    }
}

