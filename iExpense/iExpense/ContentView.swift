//
//  ContentView.swift
//  iExpense
//
//  Created by Alexander Ostrovsky on 09.08.2022.
//

import SwiftUI
struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
