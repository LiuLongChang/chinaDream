//
//  UIColor+Additions.swift
//  ChinaDream
//
//  Created by 刘隆昌 on 16/7/10.
//  Copyright © 2016年 刘隆昌. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    
    class func randomColor()->UIColor{
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        return UIColor(red: randomRed,green: randomGreen,blue: randomBlue,alpha: 1.0)
    }
    
    class func randomColorFilterDarkerOut()->UIColor {
        
        var h = CGFloat(0)
        var s = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        
        randomColor().getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        b = CGFloat(arc4random_uniform(10) + 5) / 10
        
        return UIColor(hue: h,saturation: s * 0.4, brightness:b,alpha:a)
        
    }
    
    
    
    func darkerColor(delta:CGFloat) -> UIColor {
        
        var h = CGFloat(0)
        var s = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h,saturation: s,brightness: b * delta,alpha: a)
        
    }
    
    
    func lighterColor(delta:CGFloat)->UIColor{
        
        var h = CGFloat(0)
        var s = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h,saturation: s*delta,brightness: b,alpha: a)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

