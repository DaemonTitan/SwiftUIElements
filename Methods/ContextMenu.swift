//
//  ContextMenu.swift
//  UIElements
//
//  Created by Tony Chen on 21/1/2024.
//

import SwiftUI

struct ContextMenu: View {
    @State var backgroundColor: Color = .cyan
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Siftfull Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundStyle(.white)
        .padding(30)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .shadow(radius: 10)
        
        .contextMenu(menuItems: {
            Button(action: {
                backgroundColor = .yellow
            }, label: {
                Label("Button 1", systemImage: "flame.fill")
            })
            
            Button(action: {
                backgroundColor = .red
            }, label: {
                Text("Button 2")
            })
            
            Button(action: {
                backgroundColor = .blue
            }, label: {
                HStack {
                    Text("Button 3")
                    Image(systemName: "heart.fill")
                }
            })
        })
    }
}

#Preview {
    ContextMenu()
}
