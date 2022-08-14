//
//  Triangle.swift
//  Drawing
//
//  Created by Alexander Ostrovsky on 13.08.2022.
//

import SwiftUI

struct ShapesView: View {
    @State private var thikness: CGFloat = 0.5
    @State private var heightScale: CGFloat = 1
    
    var body: some View {
        VStack {
            Spacer()
            Triangle(heightScale: heightScale)
                .stroke(.red, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200, alignment: .center)
            Spacer()
            Arrow(thickness: thikness)
                .stroke(.red, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200, alignment: .center)
            Spacer()
        }
        .toolbar {
            Button("Animate") {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                    let random = CGFloat.random(in: 0.3...0.8)
                    thikness = random
                    heightScale = (1 - random) + 0.3
                }
            }
        }
        .navigationTitle("💘 Shapes")
    }
}

struct Triangle: Shape {
    var heightScale: CGFloat = 1
    var animatableData: CGFloat {
        get { heightScale }
        set { heightScale = newValue }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY + (rect.height * (1 - heightScale))))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + (rect.height * (1 - heightScale))))

        return path
    }
}

struct Arrow: Shape {
    var thickness: CGFloat = 0.8
    var animatableData: CGFloat {
        get { thickness }
        set { thickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX + (rect.width / 2) * sin(thickness * CGFloat.pi / 2), y: rect.minY + (rect.height / 2) * cos(thickness * CGFloat.pi / 2)))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX - (rect.width / 2) * sin(thickness * CGFloat.pi / 2), y: rect.minY + (rect.height / 2) * cos(thickness * CGFloat.pi / 2)))

        return path
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShapesView()
        }
        .preferredColorScheme(.dark)
    }
}
