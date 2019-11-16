//
//  studentData.swift
//  final test
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
struct StudentStructure {
    var firstName: String
    var lastName: String
    var studentID: String
    var marks = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
    var gpa = [0.0,0.0,0.0]
    var cgpa: Double {
        return (gpa[0] + gpa[1] + gpa[2] ) / 3
    }
    
    static var studentsData = [StudentStructure]()
}
