//
//  TriangleAndSquare.swift
//  MyFirstSwiftApp
//
//  Created by LiJun on 5/27/16.
//  Copyright © 2016 LiJun. All rights reserved.
//

import Foundation

class TriangleAndSquare : NamedShape {
    
    var triangle : NamedShape {
        willSet {
            square.sideLength = newValue.sideLength;
        }
    }
    
    var square : NamedShape {
        willSet {
            triangle.sideLength = newValue.sideLength;
        }
    }
    
    init(size : Double, name: String) {
        square = NamedShape(sideLength: size, name: name)
        triangle = NamedShape(sideLength: size, name: name)
        super.init(name: name)
    }
    
    override func simpleDescription() {
        print("\(self.name) with \(numberOfSides) sides. SubItems[square[sideLength:\(square.sideLength)], triangle[sideLength:\(triangle.sideLength)]]")
    }
}

