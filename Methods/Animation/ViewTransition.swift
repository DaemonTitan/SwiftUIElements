//
//  ViewTransition.swift
//  UIElements
//
//  Created by Tony Chen on 17/1/2024.
//

import SwiftUI

struct ViewTransition: View {
    @State var showView: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Button") {
                    withAnimation(.spring()) {
                        showView.toggle()
                    }
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30.0)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    //.opacity(showView ? 1.0 : 0.0)
                    //.transition(.slide)
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: .opacity))
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ViewTransition()
}
