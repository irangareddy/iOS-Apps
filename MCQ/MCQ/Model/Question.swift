//
//  Question.swift
//  MCQ
//
//  Created by RANGA REDDY NUKALA on 18/03/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    let choices: [String]
    let answer: String
    
    init(q:String,a:[String],correctAnswer:String) {
        text = q
        choices = a
        answer = correctAnswer
        
    }
}
