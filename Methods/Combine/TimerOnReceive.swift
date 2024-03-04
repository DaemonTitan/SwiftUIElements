//
//  TimerOnReceive.swift
//  UIElements
//
//  Created by Tony Chen on 1/3/2024.
//

import SwiftUI

struct TimerOnReceive: View {
    // Publish time
    private let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // CurrentTime
    @State private var currentDate: Date = Date()
    private var dateFormatter: DateFormatter  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    // Count Down number
    @State private var count: Int = 10
    @State private var finishedText: String? = nil
    
    // Count Down Time
    @State private var timerRemaining: String = ""
    private let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    func updateTimeremaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute , .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timerRemaining = "\(hour) : \(minute) : \(second)"
    }
    

    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.purple, Color(uiColor: .blue)]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
            .ignoresSafeArea()
            
            Text(timerRemaining)
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
        }
        // Receive time and perfrom action on screen
//        .onReceive(timer, perform: { timeValue in
//            currentDate = timeValue
//        })
        
//        .onReceive(timer, perform: { _ in
//            if count <= 1 {
//                finishedText = "Wow!"
//            } else {
//                count -= 1
//            }
//        })
        
        .onReceive(timer, perform: { _ in
            updateTimeremaining()
        })
        
        
    }
}

struct AnimationCount: View {
    // Publish time
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    // Animation Counter
    @State private var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.purple, Color(uiColor: .blue)]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
            .ignoresSafeArea()
            
            HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .frame(width: 150)
            .foregroundStyle(.white)

        }
        .onReceive(timer, perform: { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                count = count == 3 ? 0 : count + 1
                // Same as above code
    //            if count == 3 {
    //                count = 0
    //            } else {
    //                count += 1
    //            }
            }

        })
    }
}

struct TabViewCount: View {
    // Publish time
    private let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    @State private var count: Int = 1
    
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.purple, Color(uiColor: .blue)]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
            .ignoresSafeArea()
            
            TabView(selection: $count,
                    content:  {
                Rectangle().tag(1).foregroundStyle(.red)
                Rectangle().tag(2).foregroundStyle(.blue)
                Rectangle().tag(3).foregroundStyle(.orange)
                Rectangle().tag(4).foregroundStyle(.pink)
                Rectangle().tag(5).foregroundStyle(.green)
            })
            .frame(height: 200)
            .tabViewStyle(.page)
            
        

        }
        .onReceive(timer, perform: { _ in
            withAnimation(.smooth) {
                count = count == 5 ? 1 : count + 1
            }

        })
    }
}

#Preview {
    //TimerOnReceive()
    //AnimationCount()
    TabViewCount()
}
