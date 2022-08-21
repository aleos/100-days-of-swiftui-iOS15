//
//  Activity.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 16.08.2022.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
}
