//
//  GameView.swift
//  Edutainment
//
//  Created by Alexander Ostrovsky on 09.08.2022.
//

import SwiftUI

struct GameView: View {
    let questions: [Question]

    @State var questionNumber = 0
    @State var answer: Int?
    @State var isShowing = false

    var body: some View {
        VStack() {
            Text(questions[questionNumber].question)
                .font(.title2)
            TextField("Your answer", value: $answer, format: .number)
                .keyboardType(.numberPad)
                .font(.title.weight(.bold))
                .multilineTextAlignment(.center)
                .onSubmit {
                    isShowing = true
                }
        }
        .padding()
        .alert("Your answer is \(answer ?? 0). Right answer is \(questions[questionNumber].answer)", isPresented: $isShowing) {
            Button("Next", action: nextQuestion)
        }
    }
    
    func nextQuestion() {
        questionNumber += 1
        answer = nil
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(questions: (0..<10).map { _ in Question(maxNumber: 10) })
    }
}
