//
//  ActionSheetFunction.swift
//  UIElements
//
//  Created by Tony Chen on 21/1/2024.
//

import SwiftUI

struct ActionSheetFunction: View {
    
    @State var showActionSheet1: Bool = false
    @State var showActionSheet2: Bool = false
    @State var article = actionArticle(title: "Error message",
                                 message: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.")
    
    var body: some View {
        
        Button {
            showActionSheet1.toggle()
        } label: {
            Text("Click here")
        }
        .padding()
        .confirmationDialog("Action sheet",
                            isPresented: $showActionSheet2) {
            Button("Dismiss") {}
            Button("Delete", role: .destructive) {}
        } message: {
            Text("Some message")
        }
        
        Button(action: {
            showActionSheet2.toggle()
        }, label: {
            Text("Click me")
        })
        .confirmationDialog("Some title", isPresented: $showActionSheet2, presenting: article) { article in
            Button("Save") {}
        } message: { article in
            Text(article.message)
        }
    }
}

struct actionArticle: Identifiable {
    var id: String { title }
    let title: String
    let message: String
}

#Preview {
    ActionSheetFunction()
}
