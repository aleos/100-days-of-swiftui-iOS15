//
//  DataController.swift
//  Bookworm
//
//  Created by Alexander Ostrovsky on 21.08.2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            guard error == nil else {
                print("Core Data failed to load: \(error!.localizedDescription)")
                return
            }
        }
    }
}
