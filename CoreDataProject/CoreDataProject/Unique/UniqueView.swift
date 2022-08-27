//
//  UniqueView.swift
//  CoreDataProject
//
//  Created by Alexander Ostrovsky on 27.08.2022.
//

import CoreData
import SwiftUI

struct UniqueView: View {
    @Environment(\.managedObjectContext) var moc

    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>

    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .navigationTitle("🥇 Unique")
    }
}

struct UniqueView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UniqueView()
        }
        .preferredColorScheme(.dark)
    }
}
