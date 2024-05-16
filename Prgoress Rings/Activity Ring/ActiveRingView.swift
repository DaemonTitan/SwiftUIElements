//
//  ActiveRingView.swift
//  UIElements
//
//  Created by Tony Chen on 16/5/2024.
//

import SwiftUI

struct ActiveRingView: View {
    /// Set ring circle start number
    @State var greenProgress: CGFloat = 0.1
    @State var orangeProgress: CGFloat = 0.1
    @State var redProgress: CGFloat = 0.1
    
    var body: some View {
        VStack(spacing: 40) {
            ZStack {
                ActivityRings(icon: "arrow.up",
                              BG: .cyan,
                              WHeight: 300,
                              completionRate: greenProgress,
                              ringThickness: 30,
                              colorGradient: Gradient(colors: [Color(uiColor: .cyan), Color(uiColor: .green)]))
                ActivityRings(icon: "arrow.up",
                              BG: .yellow,
                              WHeight: 220,
                              completionRate: orangeProgress,
                              ringThickness: 30,
                              colorGradient: Gradient(colors: [Color(uiColor: .yellow), Color(uiColor: .orange)]))
                ActivityRings(icon: "arrow.up",
                              BG: .red,
                              WHeight: 140,
                              completionRate: redProgress,
                              ringThickness: 30,
                              colorGradient: Gradient(colors: [Color(uiColor: .magenta), Color(uiColor: .red)]))
            }
            Slider(value: $greenProgress, in: 0...1)
            Slider(value: $orangeProgress, in: 0...1)
            Slider(value: $redProgress, in: 0...1)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ActiveRingView()
        .preferredColorScheme(.dark)
}
