//
//  UnevenShapes.swift
//  UIElements
//
//  Created by Tony Chen on 17/1/2024.
//

import SwiftUI

struct UnevenShapes: View {
    var body: some View {
        VStack {
            UnevenRoundedRectangle(
                cornerRadii: .init(
                    topLeading: 50.0,
                    bottomLeading: 10.0,
                    bottomTrailing: 50.0,
                    topTrailing: 10.0
                )
            )
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: 300,
                       height: 200)
        }
    }
}

#Preview {
    UnevenShapes()
}
