//
//  studentController.swift
//  customeTableViewCell
//
//  Created by Codekul on 21/04/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import Foundation

class student{
    var name : String
    var marks : Int
    var no : Int
    var grade : String
    var pic : String
    
    init(name : String, marks : Int, no : Int, grade : String, pic : String ) {
        self.name = name
        self.marks = marks
        self.no = no
        self.grade = grade
        self.pic = pic
    }
}
