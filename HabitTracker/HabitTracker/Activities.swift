//
//  Activities.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 16.08.2022.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [Activity] = []
    
    // MARK: Intents
    func add(_ name: String, description: String) {
        activities.append(Activity(name: name, description: description))
    }
}
