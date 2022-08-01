//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alexander Ostrovsky on 31.07.2022.
//

import SwiftUI

//To solve this challenge you’ll need to draw on skills you learned in tutorials 1 and 2:
//
//Start with an App template, then create a property to store the three possible moves: rock, paper, and scissors.
//You’ll need to create two @State properties to store the app’s current choice and whether the player should win or lose.
//You can use Int.random(in:) to select a random move. You can use it for whether the player should win too if you want, but there’s an even easier choice: Bool.random() is randomly true or false. After the initial value, use toggle() between rounds so it’s always changing.
//Create a VStack showing the player’s score, the app’s move, and whether the player should win or lose. You can use if shouldWin to return one of two different text views.
//The important part is making three buttons that respond to the player’s move: Rock, Paper, or Scissors.
//Use the font() modifier to adjust the size of your text. If you’re using emoji for the three moves, they also scale. Tip: You can ask for very large system fonts using .font(.system(size: 200)) – they’ll be a fixed size, but at least you can make sure they are nice and big!

struct ContentView: View {
    @State private var currentMove = Move.allCases.randomElement()!
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var round = 0
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
                    Text("You should ")
                    + Text("\(shouldWin ? "win" : "lose")")
                        .foregroundColor(shouldWin ? .green : .red)
                        .fontWeight(.black)
                    + Text(" now")
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
        round += 1
        if shouldWin && move.wins(over: currentMove) || !shouldWin && move.loses(to: currentMove) {
            score += 1
        } else {
            score -= 1
        }
        if round < 10 {
            randomise()
        } else {
            showingScore = true
        }
    }
    
    func resetGame() {
        randomise()
        round = 0
        score = 0
    }
    
    func randomise() {
        currentMove = Move.allCases.randomElement()!
        shouldWin = Bool.random()
    }
}

private extension ContentView {
    enum Move: String, CaseIterable {
        case rock = "🪨", paper = "📃", scissors = "✂️"
        func wins(over move: Move) -> Bool {
            switch self {
            case .rock: return move == .scissors
            case .paper: return move == .rock
            case .scissors: return move == .paper
            }
        }
        func loses(to move: Move) -> Bool {
            switch self {
            case .rock: return move == .paper
            case .paper: return move == .scissors
            case .scissors: return move == .rock
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
