//
//  Friend.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}

extension Friend {
    init(cachedFriend: CachedFriend) {
        id = cachedFriend.id ?? UUID()
        name = cachedFriend.wrappedName
    }
}
