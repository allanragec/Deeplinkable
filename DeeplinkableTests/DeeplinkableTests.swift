//
//  DeeplinkableTests.swift
//  DeeplinkableTests
//
//  Created by Allan Melo on 08/03/22.
//

import XCTest
@testable import Deeplinkable

class DeeplinkableRouterTests: XCTestCase {
    func testOpen_WhenHasValidStaticUrl_ShouldOpen() throws {
        let url = try XCTUnwrap(URL(string: "tests://modulea/classa"))
        let result = DeeplinkRouter.open(url)
        XCTAssertTrue(result)
    }
    
    func testOpen_WhenHasInvalidStaticUrl_ShouldNotOpen() throws {
        let url = try XCTUnwrap(URL(string: "tests://module/classa"))
        let result = DeeplinkRouter.open(url)
        XCTAssertFalse(result)
    }
    
    func testOpen_WhenHasValidDynamicUrl_ShouldOpen() throws {
        var url = try XCTUnwrap(URL(string: "tests://modulea/classb/s1/test"))
        var result = DeeplinkRouter.open(url)
        XCTAssertTrue(result)
        
        url = try XCTUnwrap(URL(string: "tests://modulea/classb/1b/test"))
        result = DeeplinkRouter.open(url)
        XCTAssertTrue(result)
        
        url = try XCTUnwrap(URL(string: "tests://modulea/classb/32/test"))
        result = DeeplinkRouter.open(url)
        XCTAssertTrue(result)
        
        url = try XCTUnwrap(URL(string: "tests://modulea/classb/cf/test"))
        result = DeeplinkRouter.open(url)
        XCTAssertTrue(result)
    }
    
    func testOpen_WhenHasInvalidDynamicUrl_ShouldNotOpen() throws {
        var url = try XCTUnwrap(URL(string: "tests://modulea/classb/1b2/test"))
        var result = DeeplinkRouter.open(url)
        XCTAssertFalse(result)
        
        url = try XCTUnwrap(URL(string: "tests://modulea/classb/1b/test1"))
        result = DeeplinkRouter.open(url)
        XCTAssertFalse(result)
        
        url = try XCTUnwrap(URL(string: "tests://modulea/classc/1b/test1"))
        result = DeeplinkRouter.open(url)
        XCTAssertFalse(result)
    }
}


class ClassAStaticDeeplink: Deeplinkable {
    static var deeplinkPath: String {
        "tests://modulea/classa"
    }
    
    static var isDynamicPath: Bool {
        false
    }
    
    static func open(url: URL) -> Bool {
        return true
    }
}

class ClassBDynamicDeeplink: Deeplinkable {
    static var deeplinkPath: String {
        "tests://modulea/classb/[a-zA-Z0-9]{0,2}/test"
    }
    
    static var isDynamicPath: Bool {
        true
    }
    
    static func open(url: URL) -> Bool {
        return true
    }
}


