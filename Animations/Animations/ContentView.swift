//
//  ContentView.swift
//  Animations
//
//  Created by Alexander Ostrovsky on 06.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Implicit Animation") { ImplicitAnimationView() }
                NavigationLink("Custom Animation") { CustomAnimationContentView() }
                NavigationLink("Animated Bindings") { AnimatedBindingsContentView() }
                NavigationLink("Explicit Animation") { ExplicitAnimationContentView() }
                NavigationLink("Controlling the Animation Stack") { ControllingTheAnimationStackContentView() }
                NavigationLink("Animating Gestures") { AnimatingGesturesContentView() }
                NavigationLink("Snake Letters") { SnakeLettersContentView() }
                NavigationLink("Transitions") { TransitionsContentView() }
                NavigationLink("Transition Modifier") { TransitionModifierView() }
            }
            .navigationTitle("💫 Animations")
        }
    }
}

struct ImplicitAnimationView: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
        .navigationTitle("Implicit Animation")
    }
}

struct CustomAnimationContentView: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap Me") {
            // animationAmount += 1
        }
        .padding(40)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
        .navigationTitle("Custom Animation")
    }
}

struct AnimatedBindingsContentView: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        print(animationAmount)

        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
        .navigationTitle("Animated Bindings")
    }
}

struct ExplicitAnimationContentView: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        .navigationTitle("Explicit Animation")
    }
}

struct ControllingTheAnimationStackContentView: View {
    @State private var enabled = false

    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        .navigationTitle("Controlling the Animation Stack")
    }
}

struct AnimatingGesturesContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.yellow, .red]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .frame(width: 300, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        dragAmount = .zero
                    }
                }
        )
        .navigationTitle("Animating Gestures")
    }
}

struct SnakeLettersContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .animation(.default.delay(Double(num) / 20), value: enabled)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
        .navigationTitle("Snake Letters")
    }
}

struct TransitionsContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        .navigationTitle("Transitions")
    }
}

struct TransitionModifierView: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        .navigationTitle("Transition Modifier")
     }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
