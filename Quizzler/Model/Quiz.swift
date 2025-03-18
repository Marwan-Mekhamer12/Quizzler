//
//  Quiz.swift
//  Quizzler
//
//  Created by Marwan Mekhamer on 18/03/2025.
//

import Foundation

struct Quiztions {
    
    let text : String
    let answer : [String]
    let correct : String
    
    init(q : String, a : [String], correctAnswer : String) {
        text = q
        answer = a
        correct = correctAnswer
    }
}
