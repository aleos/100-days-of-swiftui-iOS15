//
//  ContentView.swift
//  Instafilter
//
//  Created by Alexander Ostrovsky on 28.08.2022.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            Text("H")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
