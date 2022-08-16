//
//  ContentView.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 15.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    var body: some View {
        List(activities.activities) { activity in
            NavigationLink {
                Text("Activity description")
                    .navigationTitle("Test Activity")
            } label: {
                Text("Activity \(activity.id)")
            }
        }
        .navigationTitle("Activities")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
