//
//  ImagePaintView.swift
//  Drawing
//
//  Created by Alexander Ostrovsky on 13.08.2022.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.4, width: 1, height: 0.2), scale: 0.1), width: 50)
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.3), lineWidth: 20)
                .frame(width: 300, height: 200)
        }
        .navigationTitle("🖼 Frame")
    }
}

struct ImagePaingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImagePaintView()
        }
        .preferredColorScheme(.dark)
    }
}
