//
//  BindingProperty.swift
//  UIElements
//
//  Created by Tony Chen on 17/1/2024.
//

import SwiftUI

struct BindingProperty: View {
    @State var backgroundColors: Color = Color.red
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            // Background
            backgroundColors.ignoresSafeArea(.all)
            // Content
            VStack {
                Text(title)
                    .font(.title)
                    .foregroundStyle(Color.white)
                ButtonView(backgroundColors: $backgroundColors, title: $title)
            }
        }
    }
}

struct ButtonView: View {
    @Binding var backgroundColors: Color
    @Binding var title: String
    @State var buttonColor: Color = Color.blue
    
    var body: some View {
        Button(action: {
            backgroundColors = Color.orange
            buttonColor = Color.black
            title = "New title"
        }, label: {
            Text("Button")
                .foregroundStyle(Color.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
        })
    }
}

#Preview {
    BindingProperty()
}
