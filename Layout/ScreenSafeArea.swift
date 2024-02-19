//
//  ScreenSafeArea.swift
//  UIElements
//
//  Created by Tony Chen on 16/1/2024.
//

import SwiftUI

struct ScreenSafeArea: View {
    var body: some View {
        
        ScrollView{
            Text("Title")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            ForEach(0..<10) { index in
                RoundedRectangle(cornerRadius: 20.0)
                    .frame(height: 150)
                    .padding(20)
            }
        }
        .background(
            Color.red
                .ignoresSafeArea(.all)
        )
    }
}

#Preview {
    ScreenSafeArea()
}
