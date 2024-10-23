//
//  ButtonTapAnimation.swift
//  UIElements
//
//  Created by Tony Chen on 23/10/2024.
//

import SwiftUI

struct ButtonTapAnimation: View {
    
    @State var buttonTapped: Bool = false
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "power.circle")
                .resizable()
                .renderingMode(.original)
                .frame(width: 50, height: 50)
        }
        .buttonStyle(.automatic)

    }
}


#Preview {
    ButtonTapAnimation()
}
