//
//  ContentView.swift
//  Moonshot
//
//  Created by Alexander Ostrovsky on 11.08.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
        
    @State private var showingGrid = false
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(showingGrid ? "Grid" : "List") {
                    toggleMissionsStyle()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    func toggleMissionsStyle() {
        showingGrid.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
