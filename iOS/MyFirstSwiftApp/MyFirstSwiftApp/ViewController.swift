//
//  ViewController.swift
//  MyFirstSwiftApp
//
//  Created by LiJun on 3/30/16.
//  Copyright © 2016 LiJun. All rights reserved.
//

import UIKit
import Foundation

func helloWorld() {
    print("Hello World!");
}

func makeIncreasement() -> (Int -> Int) {
    func plusOne(n : Int) -> Int {
        return n+1;
    }
    
    return plusOne;
}

func makeDecreasement() -> (Int -> Int) {
    func minusOne(n : Int) ->Int {
        return n-1;
    }
    
    return minusOne;
}

func makePlus() -> ((Int, Int) -> Int) {
    func add(a : Int, b : Int) ->Int {
        return a + b;
    }
    
    return add;
}

func makeMinus() -> ((Int, Int) -> Int) {
    func reduce(a : Int, b : Int) ->Int {
        return a + b;
    }
    
    return reduce;
}

func greeting (let name : String, let day : String) -> String {
    let text = "Hello \(name), today is \(day)"
    return text
}

func getPrices () -> (p0 : Double, p1 : Double, p2 : Double) {
    let price1 = 0.15
    let price2 = 2.5
    let price3 = 0.00
    
    return (price1, price2, price3);
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First of all, of course, Hello World!! :)
        helloWorld()
        
        let bounds = self.view.bounds;
        let label = UILabel(frame: CGRect(x: 10, y: 60, width: bounds.size.width-10*2, height: 300));
        label.textAlignment = NSTextAlignment.Center;
        label.text = "Hello World!";
        self.view.addSubview(label);
        label.layer.borderColor = UIColor.grayColor().CGColor;
        label.layer.borderWidth = 0.5;
        label.layer.cornerRadius = 6.0;
        label.clipsToBounds = true;
        
        label.text = "Hello World! x=\(label.frame.origin.x)";
        
        var vegetableComment : NSString?;
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            vegetableComment = "Add some raisins and make ants on a log."
            
        case "cucumber", "watercress":
            vegetableComment = "That would make a good tea sandwich."
            
        case let x where x.hasSuffix("pepper"):
            vegetableComment = "Is it a spicy \(x)?"
            
        default :
            vegetableComment = "Everything tastes good in soup."
        }
        //print(vegetableComment);
        print(vegetableComment!);
        
        let a1 = makeDecreasement()(makeIncreasement()(100));
        print("\(a1)");
        
        let a2 = makePlus()(10, 6);
        print("\(a2)");
        
//        {
            //这种遍历太奇葩
            let numbers = [20, 19, 7, 12]
            print(numbers.map({
                (number: Int) -> Int in
                    let result = 3 * number
                    return result
                })
            );
            print(numbers.map({
                number in 3 * number
                })
            );
            print(numbers.map({
                (number: Int) -> Int in
                return ( (number % 2 == 1) ?0:number);
                })
            )
            var max : Int = Int.min;
            numbers.map({
                (number : Int) in
                max = ((number > max) ? number : max)
            })
            print("max=\(max)");
//        }
        
        let ascNumbers = numbers.sort{ $0 < $1}
        let descNumbers = numbers.sort{ $0 > $1}
        print("ascNumbers=\(ascNumbers)")
        print("descNumbers=\(descNumbers)")
        
        //官方的例子代码无法编译
        //sort([1,5,3,12,2]){$0>$1}
        
        let aaaa:String?
        aaaa = nil
        print(aaaa)
        
        let nameAAA = aaaa
        print(nameAAA)
        if let bbbbb:Bool? = true {
            print(bbbbb);
        }
        if let name:String? = aaaa {
            print(name)
            print("bbbb")
        } else {
            print("wrong")
        }
        while let nameBBB = aaaa {
            print("while nameBBB=\(nameBBB)")
        }
        
        for var i in 0...5 {
            print("i=\(i)")
        }
        
        print(greeting("Tom", day:"Wendesday"))
        
        let prices = getPrices()
        print("prices=\(prices)")
        print("prices.p0=\(prices.p0)")
        print("prices.0=\(prices.0)")
        
        
        let triangle = NamedShape(name: "三角形")
        print("triangle.sideLength=\(triangle.sideLength)")
        triangle.perimeter = 9.6
        print("triangle.sideLength=\(triangle.sideLength)")
        triangle.sideLength = 2
        print("triangle.perimeter=\(triangle.perimeter)")
        triangle.simpleDescription()
        
        let triangleAndSquare = TriangleAndSquare(size: 10, name: "another test sample")
        print(triangleAndSquare.square.sideLength)
        print(triangleAndSquare.triangle.sideLength)
        triangleAndSquare.simpleDescription()
        triangleAndSquare.square = NamedShape(sideLength: 50, name: "larger square")
        print(triangleAndSquare.triangle.sideLength)
        triangleAndSquare.simpleDescription()
        
        let optionalSquare : NamedShape? = NamedShape(sideLength: 2.5, name: "Optional square")
        let sideLength = optionalSquare?.sideLength
        print(sideLength)
        
        
        enum Suit {
            case Spades, Hearts, Diamonds, Clubs
            func simpleDescription() -> String {
                switch self {
                case .Spades:
                    return "spades"
                case Hearts:
                    return "hearts"
                case Diamonds:
                    return "diamonds"
                case Clubs:
                    return "clubs"
                }
            }
            func color() -> String {
                switch self {
                case Spades, Clubs:
                    return "black"
                case Diamonds, Hearts:
                    return "red"
                }
            }
        }
        let hearts = Suit.Hearts
        print(hearts.simpleDescription())
        print(hearts.color())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

