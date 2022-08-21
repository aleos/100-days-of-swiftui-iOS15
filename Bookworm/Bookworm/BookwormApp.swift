//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Alexander Ostrovsky on 21.08.2022.
//

import SwiftUI

@main
struct BookwormApp: App {
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
