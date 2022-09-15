//
//  ContentView.swift
//  RememberName
//
//  Created by Alexander Ostrovsky on 15.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                
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

struct Friend: Identifiable {
    let id = UUID()
    var photo: UIImage
    var name: String
}

@MainActor
class Friends: ObservableObject {
    
    @Published private(set) var friends: [Friend] = []
    
    init() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
