//
//  AppearDisappear.swift
//  UIElements
//
//  Created by Tony Chen on 1/2/2024.
//

import SwiftUI

struct AppearDisappear: View {
    @State var myText = "Start text."
    @State var count = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }

            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is a new text"
                }
            })
            
            .onDisappear(perform: {
                myText = "Ending text."
            })
            .navigationTitle("On appear: \(count)")
        }
    }
}

#Preview {
    AppearDisappear()
}
