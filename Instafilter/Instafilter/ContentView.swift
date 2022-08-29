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
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Select Image") {
                showingImagePicker = true
            }
            
            Button("Save Image") {
                guard let inputImage else { return }
                
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
            // fix https://stackoverflow.com/questions/69306179/phpickerviewcontroller-tapping-on-search-gets-error-unable-to-load-photos
                .ignoresSafeArea(.keyboard)
        }
        .onChange(of: inputImage, perform: loadImage)
    }
    
    func loadImage(_ inputImage: UIImage?) {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        
    }
    
//    func loadImage() {
//        guard let inputImage = UIImage(named: "Example") else { return }
//        let beginImage = CIImage(image: inputImage)
//
//        let context = CIContext()
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//
//        let amount = 1.0
//
//        let inputKeys = currentFilter.inputKeys
//
//        if inputKeys.contains(kCIInputIntensityKey) {
//            currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
//        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
//        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey) }
//
//        guard let outputImage = currentFilter.outputImage else { return }
//
//        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//            let uiImage = UIImage(cgImage: cgimg)
//            image = Image(uiImage: uiImage)
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
