//
//  DrawPatch.swift
//  UIElements
//
//  Created by Tony Chen on 8/3/2024.
//

import SwiftUI

struct DrawPatch: View {
    var controlPoint = 0.0
    
    var body: some View {
        ZStack{
            Image("ImageTemp")
            
            StreamLogo(controlPoint: controlPoint)
            // When draw the shape, it adds the fill by default. Use stroke modifier to remove the fill.
            // When draw the shape, it starts from top left corner. Use offset modifier to move it away.
                .stroke(.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: 184, height: 80)
                .offset(x: 20, y: -12)
        }
    }
}

struct StreamLogo: Shape {
    var controlPoint: Double
    
    func path(in rect: CGRect) -> Path {
        var pencil = Path()
        // Move to an origin
        pencil.move(to: CGPoint(x: rect.minX, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        // Draw line from minX to midX. Since the midX is on the left, deduct 20 from midX.
        // On the Y-axis add 8, positive values go down and negative values go up.
        pencil.addLine(to: CGPoint(x: rect.midX - 20, y: rect.minY + 8))
        
        // Y-axis deduct 15 negative values go up.
        pencil.addLine(to: CGPoint(x: rect.midX, y: rect.minY - 15))
        
        // Add 20 to midX and add 8 to minY.
        pencil.addLine(to: CGPoint(x: rect.midX + 20, y: rect.minY + 8))
        
        // X-axis goes to maxX. and Y-axis stays at minY.
        pencil.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // X-asix negative value go left. Y-axis add 57 to extend line.
        pencil.addLine(to: CGPoint(x: rect.maxX - 40, y: rect.maxY + 57))
        
        // Make X-asix shorter by 40. Y-asix add 57 to move the line go down.
        pencil.addLine(to: CGPoint(x: rect.minX + 40, y: rect.maxY + 57))

        // Draw line back to origin point
        pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        pencil.closeSubpath()
        return pencil
    }
}

#Preview {
    DrawPatch()
}
