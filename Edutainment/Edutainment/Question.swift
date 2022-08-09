//
//  Question.swift
//  Edutainment
//
//  Created by Alexander Ostrovsky on 09.08.2022.
//

import Foundation

struct Question {
    let question: String
    let answer: Int
    
    init(maxNumber: Int = 10) {
        precondition((2...12).contains(maxNumber), "Max number must be between 2 and 12.")
        
        let numbers = [Int.random(in: 1...maxNumber), Int.random(in: 1...maxNumber)]
        question = "What is \(numbers[0]) × \(numbers[1])?"
        answer = numbers[0] * numbers[1]
    }
}
