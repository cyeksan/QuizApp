//
//  Question.swift
//  Quiz App
//
//  Created by Cansu Aktas on 2023-08-12.
//

import Foundation

struct Question{
    let q: String
    let a: Array<String>
    let correctAnswer: String
    
    init(q: String, a: Array<String>, correctAnswer: String) {
        self.q = q
        self.a = a
        self.correctAnswer = correctAnswer
    }
}
