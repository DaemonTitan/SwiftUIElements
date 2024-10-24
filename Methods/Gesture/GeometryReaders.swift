//
//  GeometryReaders.swift
//  UIElements
//
//  Created by Tony Chen on 27/2/2024.
//

import SwiftUI

struct GeometryReaders: View {
    var body: some View {
        // When app requres rotation, use Geometry Reader to get screen size. It will slow down performance
        GeometryReader { geometry in
            ZStack {
                HStack(spacing: 0) {
                    ZStack {
                        Rectangle().fill(Color.red)
                        // Sets red rectangle width is 2 / 3 of screen size dyanmically
                            .frame(width: geometry.size.width * 0.6666)
                        Text("Red Rectangle Width: \n \(geometry.size.width * 0.6666)")
                    }
                    ZStack {
                        Rectangle().fill(Color.blue)
                        Text("Red Rectangle Width: \(geometry.size.width - geometry.size.width * 0.6666)")
                    }
                }
                .ignoresSafeArea()
                VStack {
                    Text("Screen width: \(geometry.size.width)")
                    Text("Screen Height: \(geometry.size.height)")
                    Spacer()
                }
            }
        }
    }
}

struct GeometryReaders1: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 0) {
                    Text("Left")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width * 0.33)
                        .background(.yellow)
                    Text("Right")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width * 0.67)
                        .background(.orange)
                }
                
                Spacer()
                Spacer()
                
                HStack(spacing: 0) {
                    Text("Left")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width / 3)
                        .background(.yellow)
                    Text("Center")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width / 3)
                        .background(.orange)
                    Text("Right")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width / 3)
                        .background(.yellow)
                }
            }
        }
        .frame(height: 50)
    }
}

struct GeometryReaders2: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text("Top bar")
                        .font(.largeTitle)
                    Text("geometry: \(geometry.size.height / 8)")
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 10)
                .background(.yellow)
                
                VStack {
                    Text("TopMiddlebar")
                        .font(.largeTitle)
                    Text("geometry: \(geometry.size.height / 3)")
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 3)
                .background(.yellow)
                
                VStack {
                    Text("Bottom")
                        .font(.largeTitle)
                    Text("geometry: \(geometry.size.height / 3)")
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 3)
                .background(.yellow)
            }
        }
    }
}

struct GeometryReaders3: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Color.clear.frame(width: (UIScreen.main.bounds.width / 2) - 175)
                ForEach(0..<10) { index in
                    GeometryReader{ geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0))
                            .opacity(1 - abs(getPercentage(geo: geometry)))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                    
                }
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        // Get half of screen width size
        let maxDistance = UIScreen.main.bounds.width / 2
        // geo.grame is GeometryProxy object provides the size and position of a view.
        // .global coordinate space means the position is measured relative to the entire screen, not just the parent view
        // Calculates the horizontal center point (midX) of a view's frame within the global coordinate space
        // When currentX (the center of the view) is at the screen center, the value is 0 (no distance from the center)
        // When currentX moves away from the center, the value increases towards 1. Reaching 1 when currentX is at screen edge
        let currentX = geo.frame(in: .global).midX
        // Calculates base on the horizontal center point relative to its half screen width size to get a ratio to the midpoint of the screen. Subtracting this ratio from 1 inverts the value, so that the value approaches 1 as currentX approaches 0, and the value approaches 0 as currentX approaches maxDistance
        return Double(1 - (currentX / maxDistance))
        //return Double(abs(currentX - maxDistance) / maxDistance)
    }
}

#Preview {
    //GeometryReaders()
    //GeometryReaders1()
    GeometryReaders2()
    //GeometryReaders3()
}
