//
//  ScrollViewReaders.swift
//  UIElements
//
//  Created by Tony Chen on 26/2/2024.
//

import SwiftUI

struct ScrollViewReaders: View {
    @State var enterNumber = ""
    @State var scrollToIndex = 0
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $enterNumber)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button(action: {
                withAnimation(.spring()) {
                    if let positionIndex = Int(enterNumber) {
                        scrollToIndex = positionIndex
                    }
                }
            }, label: {
                Text("Go to number")
            })
            
            ScrollView {
                // proxy means the location of each item in the loop on screen
                ScrollViewReader { proxy in
                 
                    
                    ForEach(0..<50) { index in
                        Text("This is item number: \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .shadow(radius: 10)
                            .padding()
                            // Add index as id to each element in array, so the scrollViewReader can find it.
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaders()
}
