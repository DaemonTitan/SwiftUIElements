//
//  ExtractSubView.swift
//  UIElements
//
//  Created by Tony Chen on 17/1/2024.
//

import SwiftUI

struct ExtractSubView: View {
    var body: some View {
        ZStack {
            // Backgorund
            Color.yellow.ignoresSafeArea(.all)
            
            // Content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            myItem(title: "Banana", count: 20, color: .green)
            myItem(title: "apple", count: 10, color: .red)
            myItem(title: "Orange", count: 10, color: .red)
        }
    }
}

struct myItem: View {
    
    var title: String
    var count: Int
    var color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text("\(title)")
        }
        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ExtractSubView()
}
