//
//  PopOverSheet.swift
//  UIElements
//
//  Created by Tony Chen on 18/1/2024.
//

import SwiftUI

struct PopOverSheet: View {
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea(.all)
            VStack {
                Button(action: {
                    withAnimation(.spring()) {
                        showNewScreen.toggle()
                    }
                }, label: {
                    Text("Button")
                        .font(.title)
                })
                Spacer()
            }
            // Transation method
            ZStack{
                if showNewScreen {
                    NewScreen(showNewScreen: $showNewScreen)
                        
                        .transition(.move(edge: .bottom))
                }
            }
            .zIndex(2.0)
            
            // Animation Offset
            NewScreen(showNewScreen: $showNewScreen)
                .offset(y: showNewScreen ? 0: UIScreen.main.bounds.height )
        }
    }
}

struct NewScreen: View {
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple.ignoresSafeArea(.all)
            
            Button(action: {
                //dismissView
                showNewScreen.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding(20)
            })
        }
    }
}

#Preview {
    PopOverSheet()
    //NewScreen()
}
