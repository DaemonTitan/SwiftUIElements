//
//  AnimationUpgarde.swift
//  UIElements
//
//  Created by Tony Chen on 6/2/2024.
//

import SwiftUI

struct AnimationUpgarde: View {
    
    @State var animate1: Bool = false
    @State var animate2: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    animate1.toggle()
                }, label: {
                    Text("Action 1")
                })
                Button(action: {
                    animate2.toggle()
                }, label: {
                    Text("Action 2")
                })
                
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: animate1 ? .leading : .trailing)
                        .background(Color.green)
                        .frame(maxHeight: .infinity, alignment: animate2 ? .top : .bottom)
                        .background(Color.orange)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
            }
          
            
        }
        .animation(.spring(), value: animate1)
        .animation(.linear(duration: 2), value: animate2)
    }
}

#Preview {
    AnimationUpgarde()
}
