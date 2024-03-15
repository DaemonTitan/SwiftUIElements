//
//  TransparentMask.swift
//  UIElements
//
//  Created by Tony Chen on 9/3/2024.
//

import SwiftUI

struct TransparentMask: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack {
                ForEach(0..<5) { item in
                    Text("Mask and Transparency")
                        .font(.title3).bold()
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                }
            }
            .frame(height: 300, alignment: .top)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .padding()
            .mask {
                LinearGradient(gradient: Gradient(colors: [
                    Color.black, Color.black, Color.black, Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
            }
            
        }
    }
}

#Preview {
    TransparentMask()
}
