//
//  Activities.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 16.08.2022.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [Activity] = [] {
        didSet {
            guard let data = try? JSONEncoder().encode(activities) else { return }
            UserDefaults.standard.set(data, forKey: "activities")
        }
    }
    
    init() {
        guard let activities = UserDefaults.standard.data(forKey: "activities").flatMap({ try? JSONDecoder().decode([Activity].self, from: $0) }) else { return }
        self.activities = activities
    }
    
    // MARK: Intents
    func add(_ name: String, description: String) {
        activities.append(Activity(name: name, description: description))
    }
}
