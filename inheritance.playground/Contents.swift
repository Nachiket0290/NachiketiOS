//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class shape {
    
    var a : Double
    init() {
        a = 0
    }
    
    func display(){
        print("Area  : \(a)")
    }
    
}

class Rangle : shape {
    var side1 :Double
    var side2 : Double
    init(x : Double , y : Double) {
        side1 = x
        side2 = y
    }
    
    func area() {
        super.a = side1 * side2
        super.display()
    }
    
}

class circle :shape {
    var r : Double
    
    init(r : Double) {
        self.r = r
    }
    func area() {
        super.a = 3.142 * r * r
        super.display()
    }
    
}

class triangle : shape {
    var h : Double
    var b : Double
    
    init(x : Double , y : Double) {
        h = x
        b = y
    }
    func area() {
        super.a = h * b * 0.5
        super.display()
    }
}

var c = circle(r: 4)
c.area()

var r = Rangle(x: 10, y: 20)
r.area()

var t = triangle(x: 10, y: 20)
t.area()
