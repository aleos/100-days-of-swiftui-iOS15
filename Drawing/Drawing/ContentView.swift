//
//  ContentView.swift
//  Drawing
//
//  Created by Alexander Ostrovsky on 13.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("🔺 Triangle (`Path`)") {
                    Triangle()
                        .stroke(.red, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                        .frame(width: 200, height: 200, alignment: .center)
                        .navigationTitle("🔺 Triangle")
                }
                NavigationLink("⭕️ Arc (`.addArc()`)") {
                    Arc(startAngle: .degrees(0), endAngle: .degrees(300), clockwise: true)
                        .strokeBorder(.red, style: StrokeStyle(lineWidth: 40))
                        .navigationTitle("⭕️ Arc")
                }
                NavigationLink("🌼 Flower (`CGAffineTransform`)") { FlowerView() }
                NavigationLink("🖼 Frame (`ImagePaint`)") { ImagePaintView() }
                NavigationLink("☢️ Gradient (`.drawingGroup()`)") { ColorCyclingCircleView() }
                NavigationLink("🚦 Blend Modes (`.blendMode()`)") { BlendModesView() }
                NavigationLink("Triangle") { Triangle() }
                NavigationLink("Triangle") { Triangle() }
                NavigationLink("Triangle") { Triangle() }
                NavigationLink("Triangle") { Triangle() }
            }
            .navigationTitle("🎨 Drawing")
        }
        .navigationViewStyle(.stack)
    }
}


// MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
