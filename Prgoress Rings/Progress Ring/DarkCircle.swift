//
//  DarkCircle.swift
//  UIElements
//
//  Created by Tony Chen on 16/5/2024.
//

import SwiftUI

struct DarkCircle: View {
    @ObservedObject var timeManager = TimerManager()
    
    var body: some View {
        ZStack {
            Color(Color(.darkGray))
                .ignoresSafeArea()
            
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 300)
                .blur(radius: 10)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.07),
                                                                            Color.clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
                .offset(x: -10, y: -10)
            
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 300)
                .blur(radius: 10)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.clear,
                                                                            Color.black.opacity(0.08)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
                .offset(x: 8, y: 8)
            
            Circle()
                .stroke(lineWidth: 30)
                .frame(width: 300)
                .foregroundStyle(Color(.darkGray))
            
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 250)
                .blur(radius: 5)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.clear,
                                                                            Color.white.opacity(0.1)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 250)
                .blur(radius: 5)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7),
                                                                            Color.clear]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            
            // Top Layer Progress Circle
            Circle()
                .trim(from: 0, to: timeManager.showValue ? timeManager.value : 0) /// Show progress circle when there is a value is avaiable.
                .stroke(style: StrokeStyle(lineWidth: 35,
                                           lineCap: .round))
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.purple,
                                                                            Color.blue]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            // Display number in the middle
            NumberValue(displayValue: timeManager.displayValue, color: .white)
        }
        .onTapGesture {
            withAnimation(.linear.speed(0.2)) {
                timeManager.showValue.toggle()
                /// Use scheduled timer for display number when prgress bar is moving.
                /// Use scheduled timer for display number dropping when prgress bar is moving up.
                timeManager.startTimer()
            }
        }
    }
}

#Preview {
    DarkCircle()
}
