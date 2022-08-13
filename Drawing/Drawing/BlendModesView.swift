//
//  BlendModesView.swift
//  Drawing
//
//  Created by Alexander Ostrovsky on 13.08.2022.
//

import SwiftUI

struct BlendModesView: View {
    @State private var amount = 0.0

    var body: some View {
        VStack {
            HStack {
                Image("Example")
                    .resizable()
                    .scaledToFit()
                    .colorMultiply(.red.opacity(amount))
                Image("Example")
                    .resizable()
                    .scaledToFit()
                    .saturation(amount)
                    .blur(radius: (1 - amount) * 3)
            }
            HStack(spacing: 50) {
                VStack {
                    ZStack {
                        Circle()
                            .fill(.red)
                            .frame(width: 150 * amount)
                            .offset(x: -25, y: -40)
                            .blendMode(.screen)
                        
                        Circle()
                            .fill(.green)
                            .frame(width: 150 * amount)
                            .offset(x: 25, y: -40)
                            .blendMode(.screen)
                        
                        Circle()
                            .fill(.blue)
                            .frame(width: 150 * amount)
                            .blendMode(.screen)
                    }
                    Text("Swift UI RGB")
                        .foregroundColor(.white)
                }
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color(red: 1, green: 0, blue: 0))
                            .frame(width: 150 * amount)
                            .offset(x: -25, y: -40)
                            .blendMode(.screen)
                        
                        Circle()
                            .fill(Color(red: 0, green: 1, blue: 0))
                            .frame(width: 150 * amount)
                            .offset(x: 25, y: -40)
                            .blendMode(.screen)
                        
                        Circle()
                            .fill(Color(red: 0, green: 0, blue: 1))
                            .frame(width: 150 * amount)
                            .blendMode(.screen)
                    }
                    Text("Real RGB")
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)

            Slider(value: $amount)
                .tint(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .navigationTitle("🚦 Blend Modes")
    }
}

struct BlendModesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BlendModesView()
        }
        .preferredColorScheme(.dark)
    }
}
