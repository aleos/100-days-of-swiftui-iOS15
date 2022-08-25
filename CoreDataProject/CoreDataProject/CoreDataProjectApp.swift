//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Alexander Ostrovsky on 25.08.2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @State private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
