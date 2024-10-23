//
//  ImageTapAnimation.swift
//  UIElements
//
//  Created by Tony Chen on 23/10/2024.
//

import SwiftUI

struct ImageTapAnimation: View {
    var body: some View {
        AnimateImage1().padding()
        AnimateImage2().padding()
    }
}

struct AnimateImage1: View {
    // 100% scale, or original size
    @State private var scale = 1.0
    
    var body: some View {
        Image(systemName: "power.circle")
            .resizable()
            .scaledToFit()
            .scaleEffect(scale)
            .frame(width: 50, height: 50)
            .onTapGesture {
                // Increate image scale by 10%
                scale += 0.1
            }
        /*
         response: the speed of spring animation. Larger is slower
         dampingFraction: the bounciness of the spring animation. Smaller is more springy.
        */
            .animation(.spring(response: 0.3,
                               dampingFraction: 0.2,
                               blendDuration: 0.1),
                       value: scale)
    }
}

struct AnimateImage2: View {
    @State private var animateImage: Bool = true
    @State private var like: Bool = false
    
    var body: some View {
        Image(systemName: like ? "heart.fill" : "heart")
            .resizable()
            .scaledToFit()
            .scaleEffect(animateImage ? 1.0 : 0.9) // if true, 100% scale. if false, 90% scale
            .frame(width: 50, height: 50)
            .onTapGesture {
                animateImage.toggle() // will shrink 90% of size by use scaleEffect
                like.toggle()
                withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.1)) {
                    animateImage.toggle() // will change back from 90% to 100% by use scaleEffect.
                }
            }
    }
}

#Preview {
    ImageTapAnimation()
}
