//
//  Badges.swift
//  UIElements
//
//  Created by Tony Chen on 5/2/2024.
//

import SwiftUI

struct Badges: View {
    var body: some View {
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hellow")
                }
                .badge(0)
            
            Color.green
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hellow")
                }
                .badge(10)
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hellow")
                }
                .badge("NEW")
        }
        
//        List {
//            Text("New Item")
//                .badge(1)
//            Text("New Item")
//                .badge(0)
//            Text("New Item")
//                .badge(12)
//            Text("New Item")
//                .badge("New")
//            Text("New Item")
//                .badge(1)
//        }
    }
}

#Preview {
    Badges()
}
