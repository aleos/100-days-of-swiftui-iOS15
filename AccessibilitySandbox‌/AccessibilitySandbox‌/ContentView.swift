//
//  ContentView.swift
//  AccessibilitySandbox‌
//
//  Created by Alexander Ostrovsky on 08.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("🎆 Identifying views with useful labels") { IdentifyingViewsView() }
                NavigationLink("🤲 Grouping children") { GroupingChildrenView() }
            }
            .navigationTitle("♿️ Accessibility")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
