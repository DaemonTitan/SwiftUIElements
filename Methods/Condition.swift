//
//  Condition.swift
//  UIElements
//
//  Created by Tony Chen on 17/1/2024.
//

import SwiftUI

struct Condition: View {
    
    @State var showCircle: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Circle Button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            if showCircle {
                ZStack {
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(Color.yellow)
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
        }
    }
}

#Preview {
    Condition()
}
