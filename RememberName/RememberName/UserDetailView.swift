//
//  UserDetailView.swift
//  RememberName
//
//  Created by Alexander Ostrovsky on 18.09.2022.
//

import SwiftUI

struct UserDetailView: View {
    
    var friendImage: UIImage
    @Binding var friendName: String

    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: friendImage)
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 300, alignment: .center)
                .clipShape(Circle())
            TextField("Name", text: $friendName)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(friendImage: UIImage(systemName: "sun.max.fill")!, friendName: .constant("Alexander"))
    }
}
