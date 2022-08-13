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
                NavigationLink("🌼 Flower (`CGAffineTransform`)") { FlowerContentView() }
                NavigationLink("🖼 Frame (`ImagePaint`)") { ImagePaintContentView() }
                NavigationLink("☢️ Gradient (`.drawingGroup()`)") { ColorCyclingCircleContentView() }
                NavigationLink("Triangle") { Triangle() }
                NavigationLink("Triangle") { Triangle() }
                NavigationLink("Triangle") { Triangle() }
                NavigationLink("Triangle") { Triangle() }
                NavigationLink("Triangle") { Triangle() }
            }
            .navigationTitle("🎨 Drawing")
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20

    // How wide to make each petal
    var petalWidth: Double = 100

    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()

        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)

            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))

            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))

            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            // add it to our main path
            path.addPath(rotatedPetal)
        }

        // now send the main path back
        return path
    }
}

struct FlowerContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0

    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.orange, style: FillStyle(eoFill: true))

            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])

            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
        .tint(.orange)
        .padding()
        .navigationTitle("🌼 Flower")
    }
}

struct ImagePaintContentView: View {
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

struct ColorCyclingCircle: View {
    var amount = 0.0
    let steps = 100

    var body: some View {
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

struct ColorCyclingCircleContentView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)

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
        }
        .padding()
        .navigationTitle("☢️ Gradient Circle")
    }
}

// MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
