//
//  AstronautView.swift
//  Moonshot
//
//  Created by Alexander Ostrovsky on 13.08.2022.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        ScrollView {
            Image(astronaut.id)
                .resizable()
                .scaledToFit()
                .padding(.top)
            Text(astronaut.description)
                .padding()
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts.values.first!)
        }
        .preferredColorScheme(.dark)
    }
}
