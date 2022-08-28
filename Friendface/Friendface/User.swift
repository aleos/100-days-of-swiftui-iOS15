//
//  User.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
