//
//  TabViews.swift
//  UIElements
//
//  Created by Tony Chen on 1/2/2024.
//

import SwiftUI

struct TabViews: View {
    
    let icons = [
        "heart.fill",
        "globe",
        "house.fill",
        "person.fill"
    ]
    
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .foregroundStyle(.white)
                    .padding(30)
                    .scaledToFit()
                
            }
        }
        .background(
            LinearGradient(gradient: Gradient(
            colors: [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))]),
                       startPoint: .topLeading, endPoint: .trailing))
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
        .padding()
    }
}

#Preview {
    TabViews()
}
