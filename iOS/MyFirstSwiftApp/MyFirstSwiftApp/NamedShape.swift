//
//  NamedShape.swift
//  MyFirstSwiftApp
//
//  Created by LiJun on 3/31/16.
//  Copyright © 2016 LiJun. All rights reserved.
//

import Foundation
import UIKit

class NamedShape : Shape {

    var name: String
//    public var viewIfLoaded: UIView? { get }
//    public var subname : String? { get }
    
    init(name: String) {
        self.name = name
        self.subname = name
    }
    
    init(sideLength : Double, name : String) {
        self.name = name
        self.subname = name
        super.init()
        self.sideLength = sideLength
    }
    
    var subname : String {
        willSet {
            self.name = "aaa"
        }
    }
    
    var perimeter : Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() {
        print("\(self.name) with \(numberOfSides) sides.")
    }
}
