//
//  ViewController.swift
//  DeplinkableSample
//
//  Created by Allan Melo on 07/03/22.
//

import UIKit
import ModuleA
import Utils
import Deeplinkable

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MainViewController"
        view.backgroundColor = .random()
        
        addButton(text: "Open ModuleAViewControllerA") { [weak self] _ in
            self?.openUrl("deeplinksample://modulea/viewcontrollera")
        }
        
        addButton(text: "Open ModuleBViewControllerA") { [weak self] _ in
            self?.openUrl("deeplinksample://moduleb/viewcontrollera")
        }
        
        addButton(text: "Open ModuleCViewControllerA") { [weak self] _ in
            self?.openUrl("deeplinksample://modulec/viewcontrollera/1bc0a67c7de/test?query=abc")
        }
    }
    
    func openUrl(_ absoluteString: String) {
        guard let url = URL(string: absoluteString) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

