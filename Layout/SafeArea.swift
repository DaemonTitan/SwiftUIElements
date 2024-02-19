//
//  SafeArea.swift
//  UIElements
//
//  Created by Tony Chen on 6/2/2024.
//

import SwiftUI

struct SafeArea: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Inserts")
            
            .safeAreaInset(edge: .top, alignment: .trailing) {
                Text("No internet, plase connect interet")
                    .frame(maxWidth: .infinity)
                    .background(Color.red.ignoresSafeArea(edges: .bottom))

            }
            
            .safeAreaInset(edge: .bottom, alignment: .center) {
                Text("Hi")
                    //.frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .clipShape(Circle())
                    .padding()
            }
        }

        

    }
}

#Preview {
    SafeArea()
}
