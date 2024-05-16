//
//  DashCircle.swift
//  UIElements
//
//  Created by Tony Chen on 16/5/2024.
//

import SwiftUI

struct DashCircle: View {
    @ObservedObject var timeManager = TimerManager()
    
    var body: some View {
        ZStack {
            Color(Color(.darkGray))
                .ignoresSafeArea()
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 20, dash: [3, 4.5]))
                    .frame(width: 300)
                
                // Top Layer Progress Circle
                Circle()
                    .trim(from: 0, to: timeManager.showValue ? timeManager.value : 0)
                    .stroke(style: StrokeStyle(lineWidth: 20, dash: [3, 4.5]))
                    .frame(width: 300)
                    .foregroundStyle(.green)
                // Make Top Layer Progress Circle Glow
                Circle()
                    .trim(from: 0, to: timeManager.showValue ? timeManager.value : 0)
                    .stroke(style: StrokeStyle(lineWidth: 20, dash: [3, 4.5]))
                    .frame(width: 300)
                    .foregroundStyle(.green)
                    .blur(radius: 15)
            }
            .rotationEffect(.degrees(-90))
            
            // Display number in the middle
            NumberValue(displayValue: timeManager.displayValue, color: .white)

        }
        .onTapGesture {
            withAnimation(.spring.speed(0.2)) {
                timeManager.showValue.toggle()
                /// Use scheduled timer for display number when prgress bar is moving.
                /// Use scheduled timer for display number dropping when prgress bar is moving up.
                timeManager.startTimer()
            }
        }
    }
}

#Preview {
    DashCircle()
}
