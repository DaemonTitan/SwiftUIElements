//
//  TapGesture.swift
//  UIElements
//
//  Created by Tony Chen on 1/2/2024.
//

import SwiftUI

struct TapGesture: View {
    @State var isSelected = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(height: 200)
                .foregroundStyle(isSelected ? Color.green : Color.red)
            Button(action: {
                isSelected.toggle()
            }, label: {
                Text("Button")
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
            })
            
            Text("Tap me")
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2, perform: {
                    isSelected.toggle()
                })
            
            
            
            
            Spacer()
        }
        .padding(40)
    }
}

#Preview {
    TapGesture()
}
