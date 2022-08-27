//
//  FilteringView.swift
//  CoreDataProject
//
//  Created by Alexander Ostrovsky on 27.08.2022.
//

import SwiftUI

struct FilteringView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == 'Star Wars'")) var shipsStarWars: FetchedResults<Ship>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var shipsStarWarsParam: FetchedResults<Ship>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var shipsLessThanF: FetchedResults<Ship>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])) var shipsUniverseIn: FetchedResults<Ship>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "E")) var shipsBeginsWithE: FetchedResults<Ship>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e")) var shipsBeginsWithECaseInsensitive: FetchedResults<Ship>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var shipsNotBeginsWithECaseInsensitive: FetchedResults<Ship>

    var body: some View {
        VStack {
            Form {
                NavigationLink("`universe == 'Star Wars'`") {
                    List(shipsStarWars, id: \.self) { ship in Text(ship.name ?? "Unknown name")}
                }
                NavigationLink("`universe == %@`") {
                    List(shipsStarWarsParam, id: \.self) { ship in Text(ship.name ?? "Unknown name")}
                }
                NavigationLink("`name < 'F'`") {
                    List(shipsLessThanF, id: \.self) { ship in Text(ship.name ?? "Unknown name")}
                }
                NavigationLink("`universe IN %@`") {
                    List(shipsUniverseIn, id: \.self) { ship in Text(ship.name ?? "Unknown name")}
                }
                NavigationLink("`name BEGINSWITH 'E'`") {
                    List(shipsBeginsWithE, id: \.self) { ship in Text(ship.name ?? "Unknown name")}
                }
                NavigationLink("`name BEGINSWITH[c] 'e'`") {
                    List(shipsBeginsWithECaseInsensitive, id: \.self) { ship in Text(ship.name ?? "Unknown name")}
                }
                NavigationLink("`NOT name BEGINSWITH[c] 'e'`") {
                    List(shipsNotBeginsWithECaseInsensitive, id: \.self) { ship in Text(ship.name ?? "Unknown name")}
                }
            }

            Button("Add Examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"

                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"

                let ship3 = Ship(context: self.moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"

                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"

                try? self.moc.save()
            }
        }
        .navigationTitle("🖇 Filtering")
    }
}

struct FilteringView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FilteringView()
        }
        .preferredColorScheme(.dark)
    }
}
