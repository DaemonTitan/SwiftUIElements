//
//  ProgressRingView.swift
//  UIElements
//
//  Created by Tony Chen on 16/5/2024.
//

import SwiftUI

class TimerManager: ObservableObject {
    @Published var displayValue = 0.0
    @Published var showValue = false
    var value = 0.56 /// Set default targed value for prgress ring to the number (0.75 * 100) = 75 %
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            if self.showValue {
                /// Add number up when pregress ring goes up
                if self.displayValue < self.value {
                    self.displayValue += 0.01
                }
                else {
                    timer.invalidate()
                }
            } else {
                /// Substract number down when progress ring goes down
                if self.displayValue > 0 {
                    self.displayValue -= 0.01
                }
                else {
                    timer.invalidate()
                }
            }
        }
    }
}

struct ProgressRingView: View {
//    @State var value = 0.99
//    @State var showValue = false
//    @State var displayValue = 0.0
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        ZStack {
            // Background layer Circle
            Circle()
                .stroke(lineWidth: 20)
                .frame(width: 200, height: 300)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            
            // Background Inner Circle
            Circle()
                .stroke(lineWidth: 0.34)
                .frame(width: 175, height: 175)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3),
                                                                            Color.clear]),
                                                startPoint: .bottomTrailing,
                                                endPoint: .topLeading))
                .overlay {
                    Circle()
                        .stroke(.black.opacity(0.1), lineWidth: 2)
                         .blur(radius: 5)
                        .mask {
                             Circle()
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black,
                                                                                            Color.clear]),
                                                                startPoint: .topLeading,
                                                                endPoint: .bottomTrailing))
                        }
                }
            
            // Top Layer Progress Circle
            Circle()
                .trim(from: 0, to: timerManager.showValue ? timerManager.value : 0) /// Show progress circle when there is a value is avaiable.
                .stroke(style: StrokeStyle(lineWidth: 24,
                                           lineCap: .round))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.purple,
                                                                            Color.blue]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
            NumberValue(displayValue: timerManager.displayValue, color: .black)
        }
        .onTapGesture {
            withAnimation(.spring.speed(0.2)) {
                timerManager.showValue.toggle()
                /// Use scheduled timer for display number when prgress bar is moving.
                /// Use scheduled timer for display number dropping when prgress bar is moving up.
                timerManager.startTimer()
            }
        }
    }
}

// Displau Number Value
struct NumberValue: View {
    var displayValue = 0.0
    var color: Color
    
    var body: some View {
        Text("\(Int(displayValue * 100)) %")
            .font(.title.bold())
            .foregroundStyle(color)
    }
}

#Preview {
    ProgressRingView()
        .environmentObject(TimerManager())
}
