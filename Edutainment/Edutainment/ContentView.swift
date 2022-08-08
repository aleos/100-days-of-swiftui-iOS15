//
//  ContentView.swift
//  Edutainment
//
//  Created by Alexander Ostrovsky on 07.08.2022.
//

import SwiftUI

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

struct ContentView: View {
    
    @State var gameIsActive = false
    @State var questions = [Question]()
    @State var maxNumber = 10
    @State var difficulty = 10
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    Stepper("Up to **\(maxNumber)**", value: $maxNumber, in: 2...12)
                } header: {
                    Text("Which multiplication tables do you want to practice?")
                }
                Section {
                    Picker("Choose difficulty", selection: $difficulty) {
                        Text("Easy (5)").tag(5)
                        Text("Medium (10)").tag(10)
                        Text("Hard (20)").tag(20)
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose difficulty")
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Let's start") {
                            startGame()
                            gameIsActive = true
                        }
                        .background(NavigationLink("", isActive: $gameIsActive, destination: { GameView(questions: questions) }))
                    }
                }
                
//                NavigationLink("Let's start!") { GameView() }
//                    .listRowBackground(Color.green.opacity(0.5))
            }
            .navigationTitle("Multiplication tables")
        }
    }
    
    func startGame() {
        questions = (0..<difficulty).map({ _ in Question(maxNumber: maxNumber) })
    }
}

struct GameView: View {
    let questions: [Question]

    @State var questionNumber = 0
    @State var answer = 0

    var body: some View {
        VStack {
            Text(questions[questionNumber].question)
            TextField("Your answer", value: $answer, format: .number)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
