//
//  ContentView.swift
//  Friendface
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var users = Users()
    var body: some View {
        NavigationView {
            List(users.users) { user in
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
            await users.fetchUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
