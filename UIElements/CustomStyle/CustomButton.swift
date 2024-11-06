//
//  CustomButton.swift
//  UIElements
//
//  Created by Tony Chen on 6/11/2024.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        VStack {
            Button1()
            
            Button2()
            
        }
    }
}


struct Button1: View {
    @State private var isPressed: Bool = false
    @State private var isSwiped: Bool = false
    
    var body: some View {
            Button {
                withAnimation(.spring) {
                    isPressed.toggle()
                }
            } label: {
                CutomButtonStyle(isPressed: $isPressed)
            }
        
        

    }
    
    var cutomButtonStyle: some View {
        GeometryReader { geometry in
        
        ZStack(alignment: .trailing) {

                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .frame(width: isPressed ? 150 : 45,
                           height: isPressed ? 60 : 45)
                    .foregroundStyle(isPressed ? Color(.lightGray) : Color(.white).opacity(0))
                
                
                Circle()
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
                    .shadow(radius: 10)
//                    .position(
//                        x: isSwiped ? 50 : geometry.size.width - 50, // Move from right to left
//                        y: geometry.size.height / 2 // Center vertically
//                    )
                    .padding(.horizontal, isPressed ? 8 : 0)
                    .overlay {
                        Image(systemName: "dollarsign")
                            .font(.headline)
                            .foregroundStyle(.black)
                    }

            
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
        
        }
    }
}

struct CutomButtonStyle: View {
    
    @Binding var isPressed: Bool
    
    var body: some View {
        //GeometryReader { geometry in
        
        ZStack(alignment: .trailing) {

                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .frame(width: isPressed ? 150 : 45,
                           height: isPressed ? 60 : 45)
                    .foregroundStyle(isPressed ? Color(.lightGray) : Color(.white).opacity(0))
                
                
                Circle()
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
                    .shadow(radius: 20)
//                    .position(
//                        x: isSwiped ? 50 : geometry.size.width - 50, // Move from right to left
//                        y: geometry.size.height / 2 // Center vertically
//                    )
                    .padding(.horizontal, isPressed ? 8 : 0)
                    .overlay {
                        Image(systemName: "dollarsign")
                            .font(.headline)
                            .foregroundStyle(.black)
                    }
            
                Image(systemName: "chineseyuanrenminbisign")
                .font(.title2)
                .foregroundStyle(.white)
                .offset(x: -110)
                .opacity(isPressed ? 1 : 0)
            

            
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
        
        //}
        
    }
}


struct Button2: View {
    @State private var isSwiped: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
              .fill(Color.blue)
              .frame(width: 50, height: 50) // Set circle size
              .position(
                  x: isSwiped ? 50 : geometry.size.width - 50, // Move from right to left
                  y: geometry.size.height / 2 // Center vertically
              )
              .onTapGesture {
                  withAnimation(.easeInOut(duration: 1.0)) {
                      isSwiped.toggle()
                  }
              }
        }
    }
}


#Preview {
    CustomButton()
}
