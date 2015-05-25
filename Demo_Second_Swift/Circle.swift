//
//  singleton.swift
//  SwiftDemo
//
//  Created by TopsTech on 02/03/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

class Circle
{
    var x: Int, y: Int
    var radius: Double
    var diameter: Double
    {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
    init(x: Int, y: Int, radius: Double) {
        self.x = x
        self.y = y
        self.radius = radius
    }
    convenience init(x: Int, y: Int, diameter: Double) {
        self.init(x: x, y: y, radius: diameter / 2)
    }
    
//    func describe() -> String {
//        return "I am a circle at \(centerString()) with an area of \(computeArea())"
//    }
    
//    override func computeArea() -> Double {
//        return M_PI * radius * radius
//    }
    
    private func centerString() -> String {
        return "(\(x),\(y))"
    }
}
