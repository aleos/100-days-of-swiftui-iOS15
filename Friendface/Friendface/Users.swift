//
//  Users.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import Foundation

class Users: ObservableObject {
    @Published private(set) var users: [User] = []
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
        } catch {
            print(error)
        }
    }
}
