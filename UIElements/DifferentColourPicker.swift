//
//  DifferentColourPicker.swift
//  UIElements
//
//  Created by Tony Chen on 31/1/2024.
//

import SwiftUI

struct DifferentColourPicker: View {
    @State var backgroundColour: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColour.ignoresSafeArea(.all)
            
            ColorPicker("Select a color",
                        selection: $backgroundColour,
                        supportsOpacity: true)
            .padding()
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .foregroundStyle(.white)
            .font(.headline)
            .padding(50)
        }
    }
}

#Preview {
    DifferentColourPicker()
}
