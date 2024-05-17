//
//  ActivityRings.swift
//  UIElements
//
//  Created by Tony Chen on 16/5/2024.
//

import SwiftUI

struct ActivityRings: View {
    
    var icon: String
    var BG: UIColor
    var WHeight: CGFloat
    var completionRate: Double
    var ringThickness: CGFloat
    var colorGradient: Gradient
    
    private var rotationDegree: Angle {
        .degrees(-90)
    }
    
    // Set angle degrees for Angular Gradient
    private var endAngle: Angle {
        .degrees(completionRate * 360 - 90)
    }
    
    // Set circle stroke style
    private var strokeStyle: StrokeStyle {
        /// Trimed circle stocke with round line cap and lineWidth
        StrokeStyle(lineWidth: ringThickness, lineCap: .round)
    }
    
    // Set angular gradient for circle stroke
    private var gradientEffect: AngularGradient {
        AngularGradient.init(gradient: colorGradient, center: .center, startAngle: rotationDegree, endAngle: endAngle)
    }
    
    // Set circle fill color
    private var gradientEndColor: Color {
        colorGradient.stops.indices.contains(1) ? colorGradient.stops[1].color : Color.clear
    }
    
    private var circleShadow: Color {
        .black.opacity(0.4)
    }
    
    // Set circle overlay position for GeometryReader use
    private var overlayPosition: (_ with: CGFloat, _ height: CGFloat) -> CGPoint {
        return { width, height in
            CGPoint(x: width / 2, y: height / 2)
        }
    }
    
    // Set circle offset position for GeometryReader use
    private var overlayOffset: (_ with: CGFloat, _ height: CGFloat) -> CGFloat {
        return { width, height in
            min(width, height) / 2
        }
    }
    
    private var overlayRotation: Angle {
        .degrees(completionRate * 360 - 90)
    }
    
    private var clippedCircleRotation: Angle {
        .degrees(-90 + completionRate * 360 )
    }
    
    // Base circle
    var body: some View {
        ZStack {
            // background circle
            Circle()
                .stroke(lineWidth: 30)
                .foregroundStyle(Color(BG).opacity(0.2))
            // Foreground circle
            Circle()
                .trim(from: 0, to: CGFloat(completionRate)) /// Trim circle to half size
                .rotation(rotationDegree) /// Rotate circle to 90 degrees
                .stroke(gradientEffect, style: strokeStyle) /// Stroke circle to the line style
                .overlay(overlayCircle) /// Add circle to the bottom
        }
        .frame(width: WHeight, height: WHeight)
        // Arrow Image
        .overlay(alignment: .top) {
            Image(systemName: icon)
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
                .offset(y: -11)
                
        }
    }
    
    // Top Ring circle
    var overlayCircle: some View {
        /// Use Geometry Reader to get the size of top layer ring position.
        GeometryReader { geo in
            Circle()
                .fill(gradientEndColor)
                .frame(width: ringThickness, height: ringThickness)
                .position(overlayPosition(geo.size.width, geo.size.height))
                .offset(x: overlayOffset(geo.size.width, geo.size.height))
                .rotationEffect(overlayRotation)
                .shadow(color: circleShadow, radius: ringThickness / 5)
        }
        .clipShape(
            /// Add another circle on to show leading circle on the line
            Circle()
                .rotation(clippedCircleRotation)
                .trim(from: 0, to: 0.1)
                .stroke(style: strokeStyle)
        )
    }
}

#Preview {
    ActivityRings(icon: "arrow.up",
                  BG: .cyan,
                  WHeight: 300,
                  completionRate: 1,
                  ringThickness: 30,
                  colorGradient: Gradient(colors: [Color(uiColor: .cyan), Color(uiColor: .green)]))
    .preferredColorScheme(.dark)
}
