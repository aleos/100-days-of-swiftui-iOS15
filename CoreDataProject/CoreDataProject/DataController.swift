//
//  DataController.swift
//  CoreDataProject
//
//  Created by Alexander Ostrovsky on 25.08.2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            guard error == nil else {
                print("Core Data failed to load: \(error!.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
