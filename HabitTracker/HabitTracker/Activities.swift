//
//  Activities.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 16.08.2022.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [Activity] = [Activity(), Activity()]
}
