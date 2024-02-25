//
//  PageNavigationStack.swift
//  UIElements
//
//  Created by Tony Chen on 6/2/2024.
//

import SwiftUI

struct PageNavigationStack: View {
    
    let fruits = ["apple", "oragne", "Banana"]
    
    @State var stackPath: [String] = []
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            ScrollView {
                VStack(spacing: 40) {
                    
                    Button(action: {
                        stackPath.append(contentsOf: [
                            "Coconut", "Watermelon", "Mango"
                        ])
                    }, label: {
                        Text("Push into new page")
                    })
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                        
                    }
                    
                    ForEach(0..<10) { x in
                        NavigationLink(value: x) {
                            Text("Click here \(x)")
                        }
                    }
                }
            }
            .navigationTitle("Navigation")
            .navigationDestination(for: Int.self) { value in
                MySecondScreen(value: value)
            }
            
            .navigationDestination(for: String.self) { value in
                Text("Another screen: \(value)")
            }
            .toolbarTitleMenu {
                Button {
                    stackPath.append("Screen 1")
                } label: {
                    Text("Screen 1")
                }
                
                Button {
                    stackPath.append("Screen 2")
                } label: {
                    Text("Screen 2")
                }
            }
        }
    }
}

struct MySecondScreen: View {
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("INIT Screen: \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

#Preview {
    PageNavigationStack()
}
