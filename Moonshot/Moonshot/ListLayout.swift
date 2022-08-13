//
//  ListLayout.swift
//  Moonshot
//
//  Created by Alexander Ostrovsky on 13.08.2022.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    ListItemView(mission: mission)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

struct ListItemView: View {
    let mission: Mission
    var body: some View {
        HStack(spacing: 0) {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .padding(8)
            
            ZStack(alignment: .leading) {
                Color.lightBackground
                VStack(alignment: .leading, spacing: 8) {
                    Text(mission.displayName)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(mission.longFormattedLaunchDate)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding(8)
            }
        }
        .frame(height: 80)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

struct ListLayout_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        ListLayout(astronauts: astronauts, missions: missions)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}
