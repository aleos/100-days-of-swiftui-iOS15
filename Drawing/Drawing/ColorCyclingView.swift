//
//  ColorCyclingView.swift
//  Drawing
//
//  Created by Alexander Ostrovsky on 13.08.2022.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    let steps = 100

    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<steps, id:\.self) { value in
                    Circle()
                        .inset(by: Double(value))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    color(for: value, brightness: 1),
                                    color(for: value, brightness: 0.5)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 2
                        )
                }
            }
            ZStack {
                ForEach(0..<steps, id:\.self) { value in
                    Rectangle()
                        .inset(by: Double(value))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    color(for: value, brightness: 1),
                                    color(for: value, brightness: 0.5)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 2
                        )
                }
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCyclingView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300)
                .layoutPriority(1000)

            ZStack {
                  LinearGradient(
                      gradient: Gradient(colors: [
                        Color(hue: 0, saturation: 1, brightness: 1),
                        Color(hue: 0.5, saturation: 1, brightness: 1),
                        Color(hue: 1, saturation: 1, brightness: 1)
                      ]),
                      startPoint: .leading,
                      endPoint: .trailing
                  )
                  .mask(Slider(value: $colorCycle))

                  // Dummy replicated slider, to allow sliding
                  Slider(value: $colorCycle)
                      .accentColor(.clear)
            }
            .padding()
        }
        .padding()
        .navigationTitle("☢️ Gradient")
    }
}

struct ColorCyclingCircleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ColorCyclingView()
        }
        .preferredColorScheme(.dark)
    }
}
