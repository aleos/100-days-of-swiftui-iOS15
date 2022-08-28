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
    //    @StateObject var users = Users()
    @State var users: [User] = []
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .gray)
                            .frame(width: 8)
                        
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("friendface")
        }
        .navigationViewStyle(.stack)
        .task {
            await fetchUsers()
        }
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        if !cachedUsers.isEmpty {
            users = cachedUsers.map { cachedUser in
                User(
                    id: cachedUser.id ?? UUID(),
                    isActive: cachedUser.isActive,
                    name: cachedUser.name ?? "",
                    age: Int(cachedUser.age),
                    company: cachedUser.company ?? "",
                    email: cachedUser.email ?? "",
                    address: cachedUser.address ?? "",
                    about: cachedUser.about ?? "",
                    registered: cachedUser.registered ?? .now,
                    tags: cachedUser.wrappedTags,
                    friends: cachedUser.wrappedFriendsArray.map({ cachedFriend in
                        Friend(id: cachedFriend.id ?? UUID(), name: cachedFriend.name ?? "")
                    })
                )
            }
        } else {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                users = try decoder.decode([User].self, from: data)
                let cachedUsers = users.map { user in
                    let cachedUser = CachedUser(context: moc)
                    cachedUser.id = user.id
                    cachedUser.isActive = user.isActive
                    cachedUser.name = user.name
                    cachedUser.age = Int16(user.age)
                    cachedUser.company = user.company
                    cachedUser.email = user.email
                    cachedUser.address = user.address
                    cachedUser.about = user.about
                    cachedUser.registered = user.registered
                    cachedUser.tags = user.tags.joined(separator: ",")
                    cachedUser.friends = NSSet(array: user.friends.map { friend in
                        let cachedFriend = CachedFriend(context: moc)
                        cachedFriend.id = friend.id
                        cachedFriend.name = friend.name
                        return cachedFriend
                    })
                    return cachedUser
                }
                try? moc.save()
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
