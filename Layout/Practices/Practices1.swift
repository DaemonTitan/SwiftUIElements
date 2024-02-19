//
//  Practices1.swift
//  UIElements
//
//  Created by Tony Chen on 16/1/2024.
//

import SwiftUI

struct Practices1: View {
    var body: some View {
        VStack {
            HStack() {
                Image(systemName: "xmark")
                Spacer()
                Image(systemName: "square.and.arrow.up")
            }
            .font(.title)
            .padding(.horizontal)
        }
        Spacer()
        
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 50)
            HStack() {
                Spacer()
                Image(systemName: "house")
                Spacer()
                Image(systemName: "location.circle")
                Spacer()
                Image(systemName: "camera.shutter.button")
                Spacer()
                Image(systemName: "heart")
                Spacer()
                Image(systemName: "gear")
                Spacer()
            }
            .font(.title2)
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    Practices1()
}
