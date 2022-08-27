//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Alexander Ostrovsky on 25.08.2022.
//

import CoreData
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("🆔 ForEach id `\\.self`") { ForEachIDSelfView() }
                NavigationLink("🥇 Unique by constraints") { UniqueView() }
                NavigationLink("🖇 Filtering") { FilteringView() }
                NavigationLink("🆔 ForEach id `\\.self`") { ForEachIDSelfView() }
                NavigationLink("🆔 ForEach id `\\.self`") { ForEachIDSelfView() }
                NavigationLink("🆔 ForEach id `\\.self`") { ForEachIDSelfView() }
                NavigationLink("🆔 ForEach id `\\.self`") { ForEachIDSelfView() }
                NavigationLink("🆔 ForEach id `\\.self`") { ForEachIDSelfView() }
                NavigationLink("🆔 ForEach id `\\.self`") { ForEachIDSelfView() }
                NavigationLink("🆔 ForEach id `\\.self`") { ForEachIDSelfView() }
            }
            .navigationTitle("🗄️ Core Data")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
