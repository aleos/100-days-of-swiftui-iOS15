//
//  User.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

extension User {
    init(cachedUser: CachedUser) {
        id = cachedUser.id ?? UUID()
        isActive = cachedUser.isActive
        name = cachedUser.wrappedName
        age = Int(cachedUser.age)
        company = cachedUser.wrappedCompany
        email = cachedUser.wrappedEmail
        address = cachedUser.wrappedAddress
        about = cachedUser.wrappedAbout
        registered = cachedUser.wrappedRegistered
        tags = cachedUser.wrappedTags
        friends = cachedUser.friendsArray.map { Friend(cachedFriend: $0) }
    }
}
