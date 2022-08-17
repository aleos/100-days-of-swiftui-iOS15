//
//  ContentView.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 15.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List(activities.activities) { activity in
                NavigationLink {
                    ActivityView(activity: activity)
                } label: {
                    Text(activity.name)
                }
            }
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(activities: activities)
            }
            .navigationTitle("Activities")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
