//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

var rect : CGRect = CGRect(origin: CGPoint(x: 20, y: 100), size: CGSize(width:200, height:300));
var rect2 = CGRect(x: 20, y: 100, width: 200, height: 300)
let widthLabel = str + String(rect2)

var view : UIView = UIView(frame: rect);
view.backgroundColor = UIColor.greenColor();

view.backgroundColor = UIColor.redColor();


