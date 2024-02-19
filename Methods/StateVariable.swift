//
//  StateVariable.swift
//  UIElements
//
//  Created by Tony Chen on 16/1/2024.
//

import SwiftUI

struct StateVariable: View {
    @State var backgroundColour: Color = Color.green
    @State var myTitle: String = "My Title"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            // Background
            backgroundColour
                .ignoresSafeArea(.all)
            // Content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                HStack(spacing: 20) {
                    Button("Button 1") {
                        backgroundColour = .red
                        myTitle = "Button 1 tapped"
                        count += 1
                    }
                    Button("Button 2") {
                        backgroundColour = .purple
                        myTitle = "Button 2 tapped"
                        count -= 1
                    }
                }
            }
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    StateVariable()
}
