//
//  NamedShape.swift
//  MyFirstSwiftApp
//
//  Created by LiJun on 3/31/16.
//  Copyright © 2016 LiJun. All rights reserved.
//

import Foundation
import UIKit

class NamedShape {
//    public var viewIfLoaded: UIView? { get }
    var numberOfSides: Int = 0;
    var name: String;
//    public var viewIfLoaded: UIView? { get }
//    public var subname : String? { get }
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
