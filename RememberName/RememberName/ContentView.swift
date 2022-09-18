//
//  ContentView.swift
//  RememberName
//
//  Created by Alexander Ostrovsky on 15.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var friends = Friends()
    @State private var showingImagePicker = false
    @State private var showingFriendFillName = false
    @State private var friendImage: UIImage?
    @State private var friendName: String = ""
    
    var body: some View {
        NavigationView {
            List(friends.array) { friend in
                HStack {
                    Image(uiImage: friend.photo)
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(height: 100)
                        .clipShape(Circle())
                    Text(friend.name)
                        .font(.headline)
                }
            }
            .navigationTitle("Friends")
            .onChange(of: friendImage) { _ in showingFriendFillName = true }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $friendImage)
            }
            .sheet(isPresented: $showingFriendFillName) {
                UserDetailView(friendImage: friendImage ?? UIImage(), friendName: $friendName)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingImagePicker = true
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
