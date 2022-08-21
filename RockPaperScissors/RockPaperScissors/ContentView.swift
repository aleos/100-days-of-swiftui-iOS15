//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alexander Ostrovsky on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentMove = Move.allCases.randomElement()!
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var round = 1
    @State private var showingScore = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Score: \(score)")
                .font(.largeTitle)
            Spacer()
            VStack {
                Text("App's move")
                    .font(.title)
                Text(currentMove.rawValue)
                    .font(.system(size: 64))
                    .padding()
                Group {
                    Text("Which one ")
                    + Text("\(shouldWin ? "wins" : "loses")")
                        .foregroundColor(shouldWin ? .green : .red)
                        .fontWeight(.black)
                    + Text("?")
                }
                .font(.title)
            }
            Spacer()
            HStack {
                ForEach(Move.allCases, id: \.self) { move in
                    Button {
                        choose(move)
                    } label: {
                        Text(move.rawValue)
                            .font(.system(size: 64))
                    }
                    .padding()
                }
            }
            Spacer()
            Spacer()
        }
        .alert("Result", isPresented: $showingScore) {
            Button("New Game", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    private func choose(_ move: Move) {
        let didWin = shouldWin ? move.wins(over: currentMove) : move.loses(to: currentMove)
        score += didWin ? 1 : -1
        
        if round < 10 {
            round += 1
            randomise()
        } else {
            showingScore = true
        }
    }
    
    func resetGame() {
        randomise()
        round = 1
        score = 0
    }
    
    func randomise() {
        currentMove = Move.allCases.randomElement()!
        shouldWin = Bool.random()
    }
}

private extension ContentView {
    enum Move: String, CaseIterable {
        case rock = "✊", paper = "✋", scissors = "✌️"
        func wins(over move: Move) -> Bool {
            switch self {
            case .rock: return move == .scissors
            case .paper: return move == .rock
            case .scissors: return move == .paper
            }
        }
        func loses(to move: Move) -> Bool { move.wins(over: self) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
