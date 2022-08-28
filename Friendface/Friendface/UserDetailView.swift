//
//  UserDetailView.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(user.about)
                    .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.tags, id: \.self) { tag in
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
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            } header: {
                Text("Contact details")
            }
            
            Section {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            } header: {
                Text("Friends")
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(user: User(id: UUID(), isActive: true, name: "John Appleseed", age: 31, company: "Apple", email: "email@john.me", address: "1 Infinite Loop, California", about: "About me", registered: .now, tags: ["Swift", "SwiftUI"], friends: [Friend(id: UUID(), name: "Anna Freeman"),Friend(id: UUID(), name: "Paul Hudson"), Friend(id: UUID(), name: "Bill Murray")]))
        }
    }
}
