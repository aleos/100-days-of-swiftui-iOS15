//
//  ContentView.swift
//  RememberName
//
//  Created by Alexander Ostrovsky on 15.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var friends = Friends()
    
    var body: some View {
        NavigationView {
            List(friends.array) { friend in
                HStack {
                    Image(uiImage: friend.photo)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                    Text(friend.name)
                        .font(.headline)
                }
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
