//
//  Users.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import Foundation

class Users: ObservableObject {
    @Published private(set) var users: [User] = []
    
    func fetchUsers() {
        var request = URLRequest(url: URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let users = try decoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = users
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
