//
//  Shape.swift
//  MyFirstSwiftApp
//
//  Created by LiJun on 3/31/16.
//  Copyright © 2016 LiJun. All rights reserved.
//

import Foundation

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}