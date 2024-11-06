//
//  CanvasDrawing.swift
//  UIElements
//
//  Created by Tony Chen on 1/11/2024.
//

import SwiftUI

struct CanvasDrawing: View {
    var body: some View {
        ScrollView {
            // Oval
            Canvas { context, size in
                let rect = CGRect(origin: .zero, size: size).insetBy(dx: 8, dy: 8)
                
                context.stroke(Path(ellipseIn: rect), with: .color(.blue), lineWidth: 4)
                
            }
            .frame(width: 300, height: 200)
            .border(Color.yellow, width: 4)
            
            // Triangle
            Canvas { context, size in
                let rect = CGRect(origin: .zero, size: size)
                
                context.fill(triangle(in: rect), with: .color(.red))
            }
            .frame(width: 300, height: 200)
            .border(Color.yellow, width: 4)

            
            // Circle
            Canvas { context, size in
                let rect = CGRect(origin: .zero, size: size)
                
                context.fill(Path(roundedRect: rect, cornerSize: CGSize(width: 10, height: 10)), with: .color(.green))
            }
            .padding()
            .frame(width: 300, height: 200)
            .border(Color.yellow, width: 4)
            
            // Arc
            Canvas { context, size in
                let rect = CGRect(origin: .zero, size: size)
                
                context.stroke(arc(in: rect), with: .color(.black), lineWidth: 4)
                
            }
            .padding()
            .frame(width: 300, height: 200)
            .border(Color.yellow, width: 4)
            
            // Draw 2 circles
            Canvas { context, size in
                let rect1 = CGRect(origin: .zero, size: size)
                let rect2 = rect1.applying(.init(scaleX: 0.5, y: 0.5))
                context.opacity = 0.3
                
                context.fill(Circle().path(in: rect1), with: .color(.red))
                context.fill(Circle().path(in: rect2), with: .color(.red))
                
            }
            .padding()
            .frame(width: 300, height: 200)
            .border(Color.yellow, width: 4)
            
            // Draw Text
            Canvas { context, size in
                let rect = CGRect(origin: .zero, size: size)
                
                let text = Text(verbatim: "Hello").font(.title)
                var resolvedText = context.resolve(text)
                resolvedText.shading = .color(.red) // add text colour
                
                context.draw(resolvedText, in: rect)
            }
            .padding()
            .frame(width: 300, height: 200)
            .border(Color.yellow, width: 4)
            
            // Draw Image
            Canvas { context, size in
                let rect = CGRect(origin: .zero, size: size)
                
                let image = context.resolve(Image("Girl"))
                
                context.draw(image, in: rect)
            }
            .padding()
            .frame(width: 300, height: 200)
            .border(Color.yellow, width: 4)
            
            // Canvas Animation
            TimelineView(.animation) { timeLineContext in
                let value = secondsValue(for: timeLineContext.date)
                
                Canvas { context, size in
                    let newSize = size.applying(.init(scaleX: value, y: 1))
                    let rect = CGRect(origin: .zero, size: newSize)
                    let gradient = Gradient(colors: [.red, .pink, .orange])
                    
                    context.fill(Rectangle().path(in: rect), with: .linearGradient(gradient, startPoint: rect.origin, endPoint: CGPoint(x: rect.width, y: 0)))
                }
                .padding()
                .frame(width: 300, height: 200)
                .border(Color.yellow, width: 4)
            }
            
            
            // Canvas Arc Animation
            TimelineView(.animation) { timeLineContext in
                let value = secondsValue(for: timeLineContext.date)
                
                Canvas { context, size in
                    
                    let rect = CGRect(origin: .zero, size: size).insetBy(dx: 4, dy: 4)
                    
                    context.stroke(Circle().path(in: rect), with: .color(.red), lineWidth: 5)
                }
                
                .padding()
                .frame(width: 300, height: 200)
                .border(Color.yellow, width: 4)
            }
        }
    }
    
    func triangle(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
    
    func arc(in rect: CGRect) -> Path {
        let startPoint: Double = 90
        let path = Path() { path in
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 4, startAngle: .degrees(startPoint), endAngle: .degrees(-90), clockwise: true)
        }
        return path
    }
    
    private func secondsValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        return Double(seconds) / 60
    }
}

#Preview {
    CanvasDrawing()
}
