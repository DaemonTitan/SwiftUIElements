//
//  Masking.swift
//  UIElements
//
//  Created by Tony Chen on 27/2/2024.
//

import SwiftUI

struct Masking: View {
    @State private var rating = 0
    
    var body: some View {
        ZStack {
            startsView
                .overlay (geometryView.mask(startsView))
        }
    }
    // Layer 1 - This is on top of Layer 0
    private var geometryView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundStyle(.yellow)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    // Calculate the frame size with give raing of 5 slots times full width
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        // disable user clicks, so user can only click Layer 0
        .allowsHitTesting(false)
    }
    
    // Layer 0
    private var startsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    Masking()
}
