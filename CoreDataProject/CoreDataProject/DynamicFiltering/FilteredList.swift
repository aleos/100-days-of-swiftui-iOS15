//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Alexander Ostrovsky on 27.08.2022.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == 'Star Wars'")) var shipsStarWars: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var shipsStarWarsParam: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var shipsLessThanF: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])) var shipsUniverseIn: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "E")) var shipsBeginsWithE: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e")) var shipsBeginsWithECaseInsensitive: FetchedResults<Ship>
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var shipsNotBeginsWithECaseInsensitive: FetchedResults<Ship>

    enum Filter {
        case equals, less, more, `in`, beginsWith, beginsWithCaseInsensitive, notBeginsWith
        func string(key: String, value: String) -> String {
            switch self {
            case .equals:
                return "\(key) == '\(value)'"
            case .less:
                return "\(key) < '\(value)'"
            case .more:
                return "\(key) > '\(value)'"
            case .in:
                return "\(key) IN '\(value)'"
            case .beginsWith:
                return "\(key) BEGINSWITH '\(value)'"
            case .beginsWithCaseInsensitive:
                return "\(key) BEGINSWITH[c] '\(value)'"
            case .notBeginsWith:
                return "NOT \(key) BEGINSWITH[c] '\(value)'"
            }
        }
    }
    
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            content(singer)
        }
    }

    init(filter: Filter = .equals, key: String, value: String, sortDescriptors: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: filter.string(key: key, value: value)))
        self.content = content
    }
}
