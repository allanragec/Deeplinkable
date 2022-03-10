//
//  ModuleCViewControllerA.swift
//  ModuleC
//
//  Created by Allan Melo on 07/03/22.
//

import UIKit
import Utils
import Deeplinkable

class ModuleCViewControllerA: UIViewController {
    let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        view.backgroundColor = .random()
        self.title = self.description
        addLabelName(text: "ViewController with dynamic path using regex")
        addLabelName(text: "pattern: \(ModuleCViewControllerA.deeplinkPath)")
        addLabelName(text: "opened url: \(url.absoluteString)")
        
        addButton(text: "Close") { [weak self] _ in
            self?.navigationController?.dismiss(animated: true)
        }
    }
}

extension ModuleCViewControllerA: Deeplinkable {
    public static var isDynamicPath: Bool {
        true
    }
    
    public static var deeplinkPath: String {
        // Here you define your deeplink path
        "deeplinksample://modulec/viewcontrollera/[a-zA-Z0-9]{0,50}/test"
    }
    
    public static func open(url: URL) -> Bool {
        // Here you define if/how you will handle your deeplink
        // Open in modal style
        // Open with push
        guard let navigation = UIApplication.shared.rootNavigation else {
            return false
        }
        
        let flowNavigation = UINavigationController(rootViewController: ModuleCViewControllerA(url: url))
        navigation.present(flowNavigation, animated: true)
        return true
    }
}
