//
//  ListSwipAction.swift
//  UIElements
//
//  Created by Tony Chen on 5/2/2024.
//

import SwiftUI

struct ListSwipAction: View {
    @State var fruits = [
        "Apple",
        "Banana",
        "Peach",
        "Watermelon"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: {
                            
                        }, label: {
                            Text("Delete")
                        })
                        .tint(.red)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Flag")
                        })
                        .tint(.orange)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Archieve")
                        })
                        .tint(.gray)
                    }
            }
        }
    }
}

#Preview {
    ListSwipAction()
}
