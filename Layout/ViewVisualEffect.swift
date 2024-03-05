//
//  ViewVisualEffect.swift
//  UIElements
//
//  Created by Tony Chen on 5/3/2024.
//

import SwiftUI

// Works better then geometryReader. Less performance issue.
// Visual Effect does not have animation.

struct ViewVisualEffect: View {
    @State var showSpacer = false
    
    var body: some View {
        VStack {
            Text("Hello, World!testtestestest")
                .padding()
                .background(Color.red)
                .visualEffect { content, geometry in
                    content
                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
                        //.grayscale(geometry.size.width >= 200 ? 1 : 0)
            }
            if showSpacer {
                Spacer()
            }
        }
        .animation(.easeInOut, value: showSpacer)
        .onTapGesture {
            showSpacer.toggle()
        }
    }
}

struct SampleScrollView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<10) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .visualEffect { content, geometry in
                            content
                                .offset(x: geometry.frame(in: .global).minY * 0.2)
                        }
                }
            }
        }
    }
}

#Preview {
    //ViewVisualEffect()
    SampleScrollView()
}
