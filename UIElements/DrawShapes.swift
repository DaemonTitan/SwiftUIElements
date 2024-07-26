//
//  DrawShapes.swift
//  UIElements
//
//  Created by Tony Chen on 9/7/2024.
//

import SwiftUI

struct DrawShapes: View {
    var body: some View {
        VStack {
//            DrawLines()
            
//            DrawRectangle()
//                .frame(width: 100, height: 200)
            
//            BottomCurvedRectangle()
//                .frame(width: 350, height: 200)
            
//            DrawTrinagle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//                .stroke(.blue, lineWidth: 10)
//                .frame(width: 200, height: 200)
//            Diamond()
//                .frame(width: 200, height: 200)
//            Trapezoid()
//                .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//                .frame(width: 200, height: 100)
            
//            Trapezoid1()
//                .frame(width: 250, height: 200)
            
//            Trapezoid2(cornersRadius: 5)
//                .fill(Color.red)
//                .frame(width: 250, height: 200)
                //.clipShape(RoundedRectangle(cornerRadius: 20))
            
//            ArchCircle1()
//                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round))
            
//            ArchCircle2()
//                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round))
            
//            RoundedCornerTrinagle1()
//                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round))
//                .frame(width: 200, height: 200)
            
//            RoundedCornerTrinagle2()
//                .stroke(.red, style: StrokeStyle(lineWidth: 10))
//                .frame(width: 200, height: 200)
            
//            RoundedCornerTrinagle3(diameter: 40)
//                .stroke(.red, style: StrokeStyle(lineWidth: 10))
//                .frame(width: 200, height: 200)
            
//            LabelShape(cornerRadius: 10, tabWidth: 110)
//                .stroke(.red, style: StrokeStyle(lineWidth: 10))
//                .frame(width: 200, height: 100)
            
//            CustomShape1(diameter: 40)
//                    .stroke(.red, style: StrokeStyle(lineWidth: 10))
//                //.fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 330, height: 250)
//            
//            RoundedTriangle(
//                        point1: CGPoint(x: 50, y: 150),
//                        point2: CGPoint(x: 150, y: 150),
//                        point3: CGPoint(x: 100, y: 50),
//                        radius: 10
//                    )
//            .stroke(.red, style: StrokeStyle(lineWidth: 10))
            
            
            CustomShape2(point1: CGPoint(x: 50, y: 170),
                         point2: CGPoint(x: 350, y: 170),
                         point3: CGPoint(x: 350, y: -30),
                         point4: CGPoint(x: 50, y: 50),
                         radius: 40)
            .stroke(.red, style: StrokeStyle(lineWidth: 10))
            .frame(width: 400, height: 300)
            
            //RoundView()

        }
    }
}

struct DrawLines: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            //path.closeSubpath()
        }
        .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct DrawRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint.zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
    }
}

struct BottomCurvedRectangle: Shape {
    var yOffset: CGFloat = 50
    
    var animatableData: CGFloat {
        get { return yOffset }
        set { yOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint.zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - yOffset))
            path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY - yOffset),
                              control: CGPoint(x: rect.midX, y: rect.maxY + yOffset))
        }
    }
}

struct DrawTrinagle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY)) // Start from center
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY)) // start from center
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY)) // Start from top left
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
        }
    }
}

struct Trapezoid1: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        }
    }
}

struct Trapezoid2: Shape {
    let cornersRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            // Dimensions for the trapezoid
            let fullHeight = rect.height
            let halfHeight = fullHeight / 2
            let width = rect.width
            
            // Top Left
            path.move(to: CGPoint(x: 0 + cornersRadius, y: halfHeight))
            
            // Bottom Left
            path.addLine(to: CGPoint(x: 0, y: fullHeight - cornersRadius))
            path.addArc(center: CGPoint(x: 0 + cornersRadius, y: fullHeight - cornersRadius), radius: cornersRadius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
            
            
            // Bottom Right
            path.addLine(to: CGPoint(x: width, y: fullHeight))
            
            // Top Right
            path.addLine(to: CGPoint(x: width, y: 0))
            
            }
        
        
    }
}

struct Arc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

struct ArchCircle1: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.width / 4,
                        startAngle: .init(degrees: 0),
                        endAngle: .init(degrees: 90),
                        clockwise: true)
        }
    }
}

struct ArchCircle2: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.minX + ((10 / 2) * 1.5), y: rect.maxY - (10 * 1.5)),
                        radius: 10 / 2,
                        startAngle: .init(degrees: 45),
                        endAngle: .init(degrees: 180),
                        clockwise: false)
        }
    }
}

struct RoundedCornerTrinagle1: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX + 10, y: rect.maxY - 10))
            
            path.addArc(center: CGPoint(x: rect.minX + ((10 / 2) * 1.5), 
                                        y: rect.maxY - (10 * 1.5)),
                        radius: 10 / 2,
                        startAngle: .init(degrees: 45),
                        endAngle: .init(degrees: 180),
                        clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.minX + ((10 / 2) * 0.5), 
                                     y: rect.minY))
            
            
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        }
    }
}

struct RoundedCornerTrinagle2: Shape {
    private var diameter: CGFloat = 15
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX - ((diameter / 2) + 3),
                                  y: rect.minY + ((diameter / 2) + 3)))
            
            path.addArc(tangent1End: CGPoint(x: rect.minX,
                                             y: rect.maxY),
                        tangent2End: CGPoint(x: rect.minX,
                                             y: rect.minY),
                        radius: diameter / 2)
            
            
            path.addArc(tangent1End: CGPoint(x: rect.minX,
                                             y: rect.minY),
                        tangent2End: CGPoint(x: rect.maxX,
                                             y: rect.minY),
                        radius: diameter / 2)
            
            path.addArc(tangent1End: CGPoint(x: rect.maxX,
                                             y: rect.minY),
                        tangent2End: CGPoint(x: rect.minX,
                                             y: rect.maxY),
                        radius: diameter / 2)
        }
    }
}

struct RoundedCornerTrinagle3: Shape {
    private var diameter: CGFloat
    
    init(diameter: CGFloat = 10) {
        self.diameter = diameter
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX - 20,
                                  y: rect.minY + 10))
            
            path.addArc(tangent1End: CGPoint(x: rect.minX + ((diameter / 2) * 0.5),
                                             y: rect.maxY - ((diameter / 2) * 0.5)),
                        tangent2End: CGPoint(x: rect.minX + ((diameter / 2) * 0.5),
                                             y: rect.minY),
                        radius: diameter / 2)
            
            path.addArc(tangent1End: CGPoint(x: rect.minX + ((diameter / 2) * 0.5),
                                             y: rect.minY),
                        tangent2End: CGPoint(x: rect.maxX + ((diameter / 2) * 0.5),
                                             y: rect.minY),
                        radius: diameter / 2)
            
            path.addArc(tangent1End: CGPoint(x: rect.maxX + ((diameter / 2) * 0.5),
                                             y: rect.minY),
                        tangent2End: CGPoint(x: rect.minX + ((diameter / 2) * 0.5),
                                             y: rect.maxY - ((diameter / 2) * 0.5)),
                        radius: diameter / 2)
        }
    }
}

struct RoundedTriangle: Shape {
    var point1: CGPoint
    var point2: CGPoint
    var point3: CGPoint
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Calculate midPoint
        let midPoint = CGPoint(x: 0.5 * (point1.x + point2.x), y: 0.5 * (point1.y + point2.y))
        
        // Move to midPoint
        path.move(to: midPoint)
        
        // Add arcs to points
        path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
        //path.addArc(tangent1End: point3, tangent2End: point1, radius: radius)
        //path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
        
        // Close the path by connecting to the start point
        //path.addLine(to: midPoint)
        
        return path
    }
}

struct LabelShape: Shape {
    let cornerRadius: CGFloat
    let tabWidth: CGFloat
        
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: cornerRadius, y: rect.height))
        path.addArc(tangent1End: CGPoint(x: rect.width, y: rect.height), tangent2End: CGPoint(x: rect.width, y: 0), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: rect.width, y: 0), tangent2End: CGPoint(x: 0, y: 0), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: rect.width - tabWidth, y: 0), tangent2End: CGPoint(x: rect.width - tabWidth, y: rect.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: rect.width - tabWidth, y: cornerRadius * 2), tangent2End: CGPoint(x: 0, y: cornerRadius * 2), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: 0, y: cornerRadius * 2), tangent2End: CGPoint(x: 0, y: rect.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: 0, y: rect.height), tangent2End: CGPoint(x: rect.width, y: rect.height), radius: cornerRadius)
        return path
    }
}

struct CustomShape1: Shape {
    private var diameter: CGFloat
    
    init(diameter: CGFloat = 20) {
        self.diameter = diameter
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX - (diameter + 9),
                                  y: rect.minY + (diameter + 4)
                                 ))
            
            // from (minX, midY) to (maxX, minY) and point to (minX, maxY)
            path.addArc(tangent1End: CGPoint(x: rect.minX,
                                             y: rect.midY
                                            ),
                        tangent2End: CGPoint(x: rect.minX,
                                             y: rect.maxY
                                            ),
                        radius: diameter )
            // from (minX, maxY) to (minX, mindY) and point to (maxX, maxY)
            path.addArc(tangent1End: CGPoint(x: rect.minX,
                                             y: rect.maxY
                                            ),
                        tangent2End: CGPoint(x: rect.maxX,
                                             y: rect.maxY
                                            ),
                        radius: diameter)
            // from (maxX, maxY ) to (minX, maxY) and point to (maxX, minY)
            path.addArc(tangent1End: CGPoint(x: rect.maxX,
                                             y: rect.maxY
                                            ),
                        tangent2End: CGPoint(x: rect.maxX,
                                             y: rect.minY
                                            ),
                        radius: diameter)
            // from (maxX, minY) to (maxX, maxY ) and point to (minX, midY)
            path.addArc(tangent1End: CGPoint(x: rect.maxX,
                                             y: rect.minY + (diameter - 10)
                                            ),
                        tangent2End: CGPoint(x: rect.minX,
                                             y: rect.midY
                                            ),
                        radius: diameter)
        }
    }
}

struct CustomShape2: Shape {
    var point1: CGPoint
    var point2: CGPoint
    var point3: CGPoint
    var point4: CGPoint
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let midPoint = CGPoint(x: 0.5 * (point1.x + point2.x), y: 0.5 * (point1.y + point2.y))
            
            path.move(to: midPoint)
            
            path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
            path.addArc(tangent1End: point3, tangent2End: point4, radius: radius)
            path.addArc(tangent1End: point4, tangent2End: point1, radius: radius)
            path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
            path.addLine(to: midPoint)
        }
    }
}

// app
struct CoordinateLines: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Draw X axis
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        // Draw Y axis
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}

struct RoundedSquare: Shape {
    var point1: CGPoint
    var point2: CGPoint
    var point3: CGPoint
    var point4: CGPoint
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Calculate midPoint (not used in square, but could be for custom logic)
        let midPoint = CGPoint(x: 0.5 * (point1.x + point3.x), y: 0.5 * (point1.y + point3.y))
        
        // Move to point1
        path.move(to: point1)
        
        // Add arcs to points
        path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
        path.addArc(tangent1End: point3, tangent2End: point4, radius: radius)
        path.addArc(tangent1End: point4, tangent2End: point1, radius: radius)
        path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
        
        // Close the path
        path.closeSubpath()
        
        return path
    }
}

struct RoundView: View {
    @State private var point1 = CGPoint(x: 50, y: 150)
    @State private var point2 = CGPoint(x: 150, y: 150)
    @State private var point3 = CGPoint(x: 150, y: 50)
    @State private var point4 = CGPoint(x: 50, y: 50)
    @State private var radius: CGFloat = 20
    
    var body: some View {
            VStack {
                ZStack {
                    CoordinateLines()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 200, height: 200)
                    
                    RoundedSquare(point1: point1, point2: point2, point3: point3, point4: point4, radius: radius)
                        .stroke(Color.blue, lineWidth: 2)
                        .frame(width: 200, height: 200)
                        .background(Color.gray.opacity(0.2))
                }
                
                HStack {
                    VStack {
                        Text("Point 1")
                        TextField("X", value: $point1.x, formatter: NumberFormatter())
                        TextField("Y", value: $point1.y, formatter: NumberFormatter())
                    }
                    
                    VStack {
                        Text("Point 2")
                        TextField("X", value: $point2.x, formatter: NumberFormatter())
                        TextField("Y", value: $point2.y, formatter: NumberFormatter())
                    }
                    
                    VStack {
                        Text("Point 3")
                        TextField("X", value: $point3.x, formatter: NumberFormatter())
                        TextField("Y", value: $point3.y, formatter: NumberFormatter())
                    }
                    
                    VStack {
                        Text("Point 4")
                        TextField("X", value: $point4.x, formatter: NumberFormatter())
                        TextField("Y", value: $point4.y, formatter: NumberFormatter())
                    }
                }
                .padding()
                
                Slider(value: $radius, in: 0...50) {
                    Text("Radius")
                }
            }
            .padding()
        }
}

#Preview {
    DrawShapes()
}
