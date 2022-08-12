//
//  ContentView.swift
//  Moonshot
//
//  Created by Alexander Ostrovsky on 11.08.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut ] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
