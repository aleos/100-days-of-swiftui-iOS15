//
//  Triangle.swift
//  Drawing
//
//  Created by Alexander Ostrovsky on 13.08.2022.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        VStack {
            Spacer()
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200, alignment: .center)
            Spacer()
            Arrow()
                .stroke(.red, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200, alignment: .center)
            Spacer()
        }
        .navigationTitle("💘 Shapes")
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

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))

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
