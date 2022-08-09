//
//  ContentView.swift
//  Edutainment
//
//  Created by Alexander Ostrovsky on 07.08.2022.
//

import SwiftUI

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
                    ToolbarItem() {
                        Button("Let's start") {
                            startGame()
                            gameIsActive = true
                        }
                        .background(NavigationLink("", isActive: $gameIsActive, destination: { GameView(questions: questions) }))
                    }
                }
            }
            .navigationTitle("Multiplication tables")
            .navigationViewStyle(.columns)
        }
    }
    
    func startGame() {
        questions = (0..<difficulty).map({ _ in Question(maxNumber: maxNumber) })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
