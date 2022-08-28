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
                Text(user.name)
            }
            .navigationTitle("friendface")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            users.fetchUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
