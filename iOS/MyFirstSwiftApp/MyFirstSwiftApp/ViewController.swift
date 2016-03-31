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
        NSLog("%@", vegetableComment!);
        
        let aaa = makeDecreasement()(makeIncreasement()(100));
        NSLog("%d", aaa);
        
//        {
            //这种遍历太奇葩
            let numbers = [20, 19, 7, 12]
            NSLog("%@", numbers.map({
                (number: Int) -> Int in
                    let result = 3 * number
                    return result
                })
            );
            NSLog("%@", numbers.map({
                (number: Int) -> Int in
                return ( (number % 2 == 1) ?0:number);
                })
            )
            var max : Int = Int.min;
            numbers.map({
                (number : Int) in
                max = ((number > max) ? number : max)
            })
            NSLog("max=%ld", max);
//        }
        
        //官方的例子代码无法编译
        //sort([1,5,3,12,2]){$0>$1}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

