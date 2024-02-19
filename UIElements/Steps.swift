//
//  Steps.swift
//  UIElements
//
//  Created by Tony Chen on 1/2/2024.
//

import SwiftUI

struct Steps: View {
    @State var stepperValue = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            Divider()
            
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper: \(stepperValue)") {
                // Increment
                incrementWidth(amount: 10)
            } onDecrement: {
                // Decrement
                incrementWidth(amount: -10)
            }
            .padding(50)

        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.spring) {
            widthIncrement += amount
        }
    }
}

#Preview {
    Steps()
}
