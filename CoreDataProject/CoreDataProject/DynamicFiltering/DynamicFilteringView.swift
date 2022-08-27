//
//  DynamicFilteringView.swift
//  CoreDataProject
//
//  Created by Alexander Ostrovsky on 27.08.2022.
//

import SwiftUI

struct DynamicFilteringView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"

    var body: some View {
        VStack {
            FilteredList(filter: .beginsWithCaseInsensitive, key: "lastName", value: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
        .navigationTitle("🧑‍🎤 DynamicFiltering")
    }
}

struct DynamicFilteringView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DynamicFilteringView()
        }
        .preferredColorScheme(.dark)
    }
}
