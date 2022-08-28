//
//  UserDetailView.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import CoreData
import SwiftUI

struct UserDetailView: View {
    var user: CachedUser
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(user.wrappedAbout)
                    .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.wrappedTags, id: \.self) { tag in
                            Text(tag)
                                .padding(.horizontal)
                                .background(Capsule().foregroundColor(.accentColor.opacity(0.2)))
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            Section {
                Text("Address: \(user.wrappedAddress)")
                Text("Company: \(user.wrappedCompany)")
            } header: {
                Text("Contact details")
            }
            
            Section {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            } header: {
                Text("Friends")
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.wrappedName)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let user = User(
            id: UUID(),
            isActive: true,
            name: "John Appleseed",
            age: 31,
            company: "Apple",
            email: "email@john.me",
            address: "1 Infinite Loop, California",
            about: "About me",
            registered: .now,
            tags: ["Swift", "SwiftUI"],
            friends: [
                Friend(id: UUID(), name: "Anna Freeman"),
                Friend(id: UUID(), name: "Paul Hudson"),
                Friend(id: UUID(), name: "Bill Murray")
            ]
        )
        let cachedUser = CachedUser(user: user, context: moc)
        return NavigationView {
            UserDetailView(user: cachedUser)
        }
    }
}
