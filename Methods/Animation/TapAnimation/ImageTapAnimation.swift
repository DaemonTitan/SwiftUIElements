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
        Animateimage3().padding()
        SelectItemAnimate().padding()
        SampleImage().padding()
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
    @State private var animateImage: Bool = false
    @State private var like: Bool = false
    
    var body: some View {
        Image(systemName: like ? "heart.fill" : "heart")
            .resizable()
            .scaledToFit()
            .shadow(color: .black, radius: 10)
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

struct Animateimage3: View {
    @State private var imageStackAnimate: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.white)
                .frame(width: 60, height: 60)
                .shadow(radius: 10)
            Image(systemName: "flag.2.crossed")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
        .scaleEffect(imageStackAnimate ? 1.5 : 1.0)
        .onTapGesture {
            imageStackAnimate.toggle()
            withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.1)) {
                imageStackAnimate.toggle()
            }
        }
    }
}

struct SelectItemAnimate: View {
    @State var bounceAnimate: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.white)
                .frame(width: 60, height: 60)
                .shadow(color: .gray, radius: bounceAnimate ? 12 : 8)
                .animation(.smooth, value: bounceAnimate)
            Image(systemName: "eraser")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        .scaleEffect(bounceAnimate ? 1.5 : 1.0)
        .animation(.bouncy, value: bounceAnimate)
        .onTapGesture {
            bounceAnimate.toggle()
        }
    }
}

struct SampleImage: View {
    var body: some View {
        GenericTapContent(tapContent: stackImage)
        GenericSelectItem(selectContent: stackImage)
    }
    
    var stackImage: some View {
        ZStack {
            Circle()
                .foregroundStyle(.white)
                .frame(width: 60, height: 60)
                .shadow(color: .gray, radius: 10)
            Image("Girl")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
    }
}

struct GenericTapContent<Content: View>: View {
    var tapContent: Content
    @State private var animateImage: Bool = false
    
    var body: some View {
        tapContent
            .scaleEffect(animateImage ? 1.0 : 0.9)
            .frame(width: 50, height: 50)
            .onTapGesture {
                animateImage.toggle()
                withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.1)) {
                    animateImage.toggle()
                }
            }
    }
}

struct GenericSelectItem<Content: View>: View {
    var selectContent: Content
    @State private var bounceAnimate: Bool = false
    
    var body: some View {
    selectContent
        .scaleEffect(bounceAnimate ? 1.5 : 1.0)
        .animation(.bouncy, value: bounceAnimate)
        .onTapGesture {
            bounceAnimate.toggle()
        }
    }
}


#Preview {
    ImageTapAnimation()
}
