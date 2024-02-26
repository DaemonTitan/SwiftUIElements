//
//  Rotation.swift
//  UIElements
//
//  Created by Tony Chen on 26/2/2024.
//

import SwiftUI

struct Rotation: View {
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded{ value in
                        withAnimation(.spring) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
        
    }
}

#Preview {
    Rotation()
}
