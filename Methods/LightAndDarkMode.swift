//
//  LightAndDarkMode.swift
//  UIElements
//
//  Created by Tony Chen on 1/2/2024.
//

import SwiftUI

struct LightAndDarkMode: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This text is PRIMARY")
                        .foregroundStyle(.primary)
                    Text("This text is SECONDARY")
                        .foregroundStyle(.secondary)
                    Text("This text is Black")
                        .foregroundStyle(.black)
                    Text("This text is WHITE")
                        .foregroundStyle(.white)
                    Text("This text is Red")
                        .foregroundStyle(.red)
                    Text("This text is Globally adaptive!")
                        .foregroundStyle(Color("AdaptiveColor"))
                    Text("This text is Locally adaptive!")
                        .foregroundStyle(colorScheme == .light ? .green : .yellow)
                }
            }
            .navigationTitle("Dark Mode")
        }
    }
}

#Preview {
    LightAndDarkMode().preferredColorScheme(.dark)
}
