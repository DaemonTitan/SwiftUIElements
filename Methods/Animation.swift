//
//  Animation.swift
//  UIElements
//
//  Created by Tony Chen on 17/1/2024.
//

import SwiftUI

struct Animation: View {
    
    @State var isAnimated: Bool = false
    @State var animated: Bool = false
    @State var springAnimation: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(.default.repeatCount(5, autoreverses: true)) {
                        isAnimated.toggle()
                }
            }
            .padding()
            Button("New Button") {
                animated.toggle()
            }
            .padding()
            Button("Spring Animation") {
                springAnimation.toggle()
            }
            //RectangleAnimations(isAnimated: $isAnimated)
            //RectangleAnimationTiming(animated: $animated)
            RectangleSpringAnimation(springAnimation: $springAnimation)

        }
    }
}

struct RectangleAnimations: View {
    @Binding var isAnimated: Bool
    
    var body: some View {
        Spacer()
        RoundedRectangle(cornerRadius: isAnimated ? 50 : 0)
            .fill(isAnimated ? Color.red : Color.yellow)
            .frame(width: isAnimated ? 100 : 300,
                   height: isAnimated ? 100 : 300)
            .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
            .offset(y: isAnimated ? 300 : 0)
            
        Spacer()
    }
}

struct RectangleAnimationTiming: View {
    @Binding var animated: Bool
    let timing: Double = 5.0
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20.0)
            .frame(width: animated ? 350 : 50, height: 100)
            .animation(.linear(duration: timing), value: animated)
        
        RoundedRectangle(cornerRadius: 20.0)
            .frame(width: animated ? 350 : 50, height: 100)
            .animation(.easeIn(duration: timing), value: animated)
        
        RoundedRectangle(cornerRadius: 20.0)
            .frame(width: animated ? 350 : 50, height: 100)
            .animation(.easeInOut(duration: timing), value: animated)
        
        RoundedRectangle(cornerRadius: 20.0)
            .frame(width: animated ? 350 : 50, height: 100)
            .animation(.easeOut(duration: timing), value: animated)
        
        RoundedRectangle(cornerRadius: 20.0)
            .frame(width: animated ? 350 : 50, height: 100)
            .animation(.easeInOut(duration: timing), value: animated)
    }
}

struct RectangleSpringAnimation: View {
    @Binding var springAnimation: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .frame(width: springAnimation ? 350 : 50, height: 100)
            .animation(.spring(response: 0.5,
                               dampingFraction: 0.7,
                               blendDuration: 1.0), value: springAnimation)

    }
}



#Preview {
    Animation()
}
