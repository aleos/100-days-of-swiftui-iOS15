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
                NavigationLink("💘 Shapes (`Path`)") {
                    ShapesView()
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
                NavigationLink("🪤 Trapezoid (`AnimatableData`)") { TrapezoidView() }
                NavigationLink("🏁 Board (`AnimatablePair`)") { CheckerboardView() }
                NavigationLink("🌀 Spirograph") { SpirographView() }
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
