//
//  AnyClass.swift
//  Deeplinkable
//
//  Created by Allan Melo on 08/03/22.
//

import Foundation

struct Class {
    static var all: [AnyClass] {
        let expectedClassCount = objc_getClassList(nil, 0)
        let allClassesPointers = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(expectedClassCount))
        
        let autoreleasingAllClassesPointers = AutoreleasingUnsafeMutablePointer<AnyClass>(allClassesPointers)
        let currentClassCount: Int32 = objc_getClassList(autoreleasingAllClassesPointers, expectedClassCount)
        
        var allClasses = [AnyClass]()
        for i in 0 ..< currentClassCount {
            allClasses.append(allClassesPointers[Int(i)])
        }
        
        allClassesPointers.deallocate()
        
        return allClasses
    }
}
