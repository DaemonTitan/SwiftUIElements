//
//  BackgroundMaterials.swift
//  UIElements
//
//  Created by Tony Chen on 5/2/2024.
//

import SwiftUI

struct BackgroundMaterials: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("HI")
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30.0))
        }
        .ignoresSafeArea()
        .background(
            Image("Star")
        )
    }
}

#Preview {
    BackgroundMaterials()
}
