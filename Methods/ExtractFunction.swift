//
//  ExtractFunction.swift
//  UIElements
//
//  Created by Tony Chen on 17/1/2024.
//

import SwiftUI

struct ExtractFunction: View {
    
    @State var backgoundColors: Color = Color.yellow
    
    var body: some View {
        ZStack {
            // Background
            backgoundColors
                .ignoresSafeArea(.all)
            
            // Content
            contentLayer
            }
        }
    
    func buttonTapped() {
        backgoundColors = .cyan
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            Button(action: {
                buttonTapped()
            }, label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
            })
                
            }
    }
}

#Preview {
    ExtractFunction()
}
