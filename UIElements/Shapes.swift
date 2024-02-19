//
//  Shapes.swift
//  UIElements
//
//  Created by Tony Chen on 15/1/2024.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color(.red))
                .frame(width: 300,
                       height: 150)
                .shadow(color: .red.opacity(0.3),
                        radius: 10,
                        x: -20,
                        y: -20
                )
            
                .padding(10)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    //Color(.blue)
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color.orange, Color.blue]),
                        startPoint: .leading,
                        endPoint: .trailing)
                )
                .frame(width: 300,
                       height: 150)
                .shadow(color: .blue.opacity(0.3),
                        radius: 10,
                        x: -20,
                        y: -20
                )
            
                .padding(10)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    //Color(.blue)
                    RadialGradient(
                        gradient: Gradient(
                            colors: [Color.red, Color.blue]),
                        center: .topLeading,
                        startRadius: 5,
                        endRadius: 300)
                )
                .frame(width: 300,
                       height: 150)
                .shadow(color: .blue.opacity(0.3),
                        radius: 10,
                        x: -20,
                        y: -20
                )
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    //Color(.blue)
                    AngularGradient.init(
                        gradient: Gradient(
                            colors: [Color.red, Color.blue]),
                        center: .topLeading,
                        angle: .degrees(225))
                )
                .frame(width: 300,
                       height: 150)
                .shadow(color: .blue.opacity(0.3),
                        radius: 10,
                        x: -20,
                        y: -20
                )
        }
    }
}

#Preview {
    Shapes()
}
