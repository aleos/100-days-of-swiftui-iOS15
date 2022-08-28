//
//  UserDetailView.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import SwiftUI

//struct User: Codable, Identifiable {
//    var id: String
//    var isActive: Bool
//    var name: String
//    var age: Int
//    var email: String
//    var address: String
//    var about: String
//    var registered: Date
//    var tags: [String]
//    var friends: [Friend]
//}

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.about)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                            .padding(.horizontal)
                            .background(Capsule().foregroundColor(.blue.opacity(0.3)))
                    }
                }
                .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                Text("Friends")
                    .font(.title)
                    .padding(.vertical)
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
            .padding()
            Spacer()
        }
        .navigationTitle(user.name)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(user: User(id: UUID().uuidString, isActive: true, name: "John Appleseed", age: 31, email: "email@john.me", address: "1 Infinite Loop, California", about: "About me", registered: .now, tags: ["Swift", "SwiftUI"], friends: [Friend(id: UUID().uuidString, name: "Anna Freeman"),Friend(id: UUID().uuidString, name: "Paul Hudson"), Friend(id: UUID().uuidString, name: "Bill Murray")]))
        }
    }
}
