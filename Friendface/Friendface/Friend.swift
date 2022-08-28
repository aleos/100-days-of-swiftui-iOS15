//
//  Friend.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}
