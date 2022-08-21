//
//  ContentView.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 15.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Activities()
    
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationView {
            List(data.activities) { activity in
                NavigationLink {
                    ActivityView(data: data, activity: activity)
                } label: {
                    HStack {
                        Text(activity.title)

                        Spacer()

                        Text(String(activity.completionCount))
                            .font(.caption.weight(.black))
                            .padding(5)
                            .frame(minWidth: 50)
                            .background(color(for: activity))
                            .clipShape(Capsule())
                    }
                }
            }
            .toolbar {
                Button {
                    addingNewActivity = true
                } label: {
                    Label("Add new activity", systemImage: "plus")
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivityView(data: data)
            }
            .navigationTitle("Activities")
        }
        .navigationViewStyle(.stack)
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            return .red
        } else if activity.completionCount < 10 {
            return .orange
        } else if activity.completionCount < 20 {
            return .green
        } else if activity.completionCount < 50 {
            return .blue
        } else {
            return .indigo
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
