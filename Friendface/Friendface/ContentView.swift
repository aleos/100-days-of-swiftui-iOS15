//
//  ContentView.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .gray)
                            .frame(width: 8)
                        
                        Text(user.wrappedName)
                    }
                }
            }
            .navigationTitle("friendface")
        }
        .navigationViewStyle(.stack)
        .task {
            do {
                try await fetchUsers()
            } catch {
                print(error)
            }
        }
    }
    
    func fetchUsers() async throws {
        guard users.isEmpty else { return }
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try decoder.decode([User].self, from: data)
            try await MainActor.run { try updateCache(with: users) }
        }
    }
    
    func updateCache(with downloadedUsers: [User]) throws {
        for user in downloadedUsers {
            _ = CachedUser(user: user, context: moc)
        }
        try moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
