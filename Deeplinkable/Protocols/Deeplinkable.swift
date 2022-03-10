import UIKit

@objc
public protocol Deeplinkable {
    static var deeplinkPath: String { get }
    static var isDynamicPath: Bool { get }
    static func open(url: URL) -> Bool
}
