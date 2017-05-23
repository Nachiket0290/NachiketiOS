//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

//: Playground - noun: a place where people can play


class complexNumber {
    var real : Int
    var img : Int
    var add_real : Int
    var add_img :Int
    var add : String
    var sub_real : Int
    var sub_img :Int
    var sub : String
    
    
    init() {
        real = 0
        img = 0
        add_real = 0
        add_img = 0
        add = ""
        sub_real = 0
        sub_img = 0
        sub = ""
    }
    init(_ x : Int , _ y : Int) {
        real = x
        img = y
        add_real = 0
        add_img = 0
        add = ""
        sub_real = 0
        sub_img = 0
        sub = ""
    }
    
    func addition(_ a : Int , _ b: Int , _ c : Int , _ d : Int) -> String {
        add_real = a + c
        add_img = b + d
        add = ("\(add_real) + \(add_img)i")
        return add
    }
    
    func Substract(_ a : Int , _ b: Int , _ c : Int , _ d : Int) -> String {
        sub_real = a - c
        sub_img = b - d
        sub = ("\(sub_real) + \(sub_img)i")
        return sub
    }
    
    func display( )
    {
        print(add)
        print(sub)
    }
}

var o = complexNumber(10 , 20)
//o.real
//o.img

var o1 = complexNumber(30,40)

var add = o.addition(o.real,o.img ,o1.real, o1.img)

var sub = o.Substract(o.real,o.img ,o1.real, o1.img)

//print(add)
//print(sub)

o.display()

