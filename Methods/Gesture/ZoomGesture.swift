//
//  ZoomGesture.swift
//  UIElements
//
//  Created by Tony Chen on 26/2/2024.
//

import SwiftUI

struct ZoomGesture: View {
    @State private var currentAmount: CGFloat = 1.0
    @State private var lastAmount: CGFloat = 0
    
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(Color.red.clipShape(RoundedRectangle(cornerRadius: 10)))
            .scaleEffect(currentAmount + lastAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        lastAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

struct ZoomGestureSample: View {
    @State private var currentAmount: CGFloat = 0
    @State private var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("Zoom Gesture")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(magifyGesture)
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
    
    
    var magifyGesture: some Gesture {
        return MagnifyGesture()
            .onChanged { value in
                currentAmount = value.magnification - 1
            }
            .onEnded { value in
                withAnimation(.spring) {
                    //lastAmount += currentAmount
                    currentAmount = 0
                }
            }
    }
}

#Preview {
    //ZoomGesture()
    ZoomGestureSample()
}
