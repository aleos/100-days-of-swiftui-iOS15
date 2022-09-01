//
//  ContentView.swift
//  BucketList
//
//  Created by Alexander Ostrovsky on 01.09.2022.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    
    let users = [
            User(firstName: "Arnold", lastName: "Rimmer"),
            User(firstName: "Kristine", lastName: "Kochanski"),
            User(firstName: "David", lastName: "Lister"),
        ].sorted()

        var body: some View {
            List(users) { user in
                Text("\(user.lastName), \(user.firstName)")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}