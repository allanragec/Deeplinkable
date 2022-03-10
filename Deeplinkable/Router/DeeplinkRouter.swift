//
//  DeeplinkRouter.swift
//  Deeplinkable
//
//  Created by Allan Melo on 08/03/22.
//

import Foundation
import UIKit

public final class DeeplinkRouter {
    static let shared = DeeplinkRouter()
    
    private let indexedStaticDeeplinks: [String: AnyClass]
    private let indexedDynamicDeeplinks: [String: AnyClass]
    
    private init() {
        let deeplinkClassess = DeeplinkRouter.getDeeplinkableClasses()
        
        self.indexedStaticDeeplinks = DeeplinkRouter.getStaticDeeplinkables(classes: deeplinkClassess)
        self.indexedDynamicDeeplinks = DeeplinkRouter.getDynamicDeeplinkables(classes: deeplinkClassess)
    }
    
    @discardableResult
    public static func open(_ url: URL) -> Bool {
        let router = DeeplinkRouter.shared
        
        guard let deeplinkable = router.indexedStaticDeeplinks[url.rawPath] else {
            return router.openDynamicUrl(url)
        }
        
        return deeplinkable.open(url: url)
    }
    
    public static func setup(shouldLogIndexedDeeplinks: Bool = false) {
        _ = shared
        
        if shouldLogIndexedDeeplinks {
            debugPrint("Deeplinkable: Indexed static urls")
            logIndexedDeeplinks(shared.indexedStaticDeeplinks)
            debugPrint("Deeplinkable: Indexed dynamic urls")
            logIndexedDeeplinks(shared.indexedDynamicDeeplinks)
            debugPrint("-------------------------")
        }
    }
    
    private static func logIndexedDeeplinks(_ indexedDeeplinks: [String: AnyClass]) {
        for item in indexedDeeplinks {
            debugPrint("Indexed url: \(item.key) at: \(item.value.description())")
        }
    }
    
    private func openDynamicUrl(_ url: URL) -> Bool {
        guard let deeplinkable = indexedDynamicDeeplinks.first(where: {
            url.rawPath.isValidForRegex($0.key)
        }) else {
            return false
        }
        
        return deeplinkable.value.open(url: url)
    }
    
    private static func getStaticDeeplinkables(classes: [AnyClass]) -> [String: AnyClass] {
        var staticDeeplinkables = [String: AnyClass]()
        for deeplinkable in classes where !deeplinkable.isDynamicPath {
            guard let deeplinkPath = deeplinkable.deeplinkPath else { continue }
            staticDeeplinkables[deeplinkPath] = deeplinkable
        }
        return staticDeeplinkables
    }
    
    private static func getDynamicDeeplinkables(classes: [AnyClass]) -> [String: AnyClass] {
        var dynamicDeeplinkables = [String: AnyClass]()
        for deeplinkable in classes where deeplinkable.isDynamicPath {
            guard let deeplinkPath = deeplinkable.deeplinkPath else { continue }
            dynamicDeeplinkables[deeplinkPath] = deeplinkable
        }
        return dynamicDeeplinkables
    }
    
    private static func getDeeplinkableClasses()-> [AnyClass] {
        Class.all
            .filter { class_conformsToProtocol($0, Deeplinkable.self) }
    }
}
