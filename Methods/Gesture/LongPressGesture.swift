//
//  LongPressGesture.swift
//  UIElements
//
//  Created by Tony Chen on 26/2/2024.
//

import SwiftUI

struct LongPressGesture: View {
    
    @State private var isComplete = false
    
    var body: some View {
        Text(isComplete ? "COMPLETED" : "NOT COMPLETE")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 1) {
                isComplete.toggle()
            }
    }
}

struct NewLongPressGesture: View {
    @State private var isComplete = false
    @State private var isSuccess = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("Click here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        // The action to perform when a long press is recognized
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { inProgress in
                        // A closure to run when the pressing state of the gesture changes,
                        if inProgress {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }
                
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
    }
}

#Preview {
    //LongPressGesture()
    NewLongPressGesture()
}
