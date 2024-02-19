//
//  AlertFunction.swift
//  UIElements
//
//  Created by Tony Chen on 21/1/2024.
//

import SwiftUI

struct AlertFunction: View {
    @State var backgroundColor: Color = Color.yellow
    @State var showAlert1: Bool = false
    @State var showAlert2: Bool = false
    @State var showAlert3: Bool = false
    @State var showAlert4: Bool = false
    let alertTitle: String = "Error message"
    let alertMessage: String = "Lorem ipsum dolor sit amet"
    @State var article = Article(title: "Error message",
                                 message: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.")
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea(edges: .all)
            
            VStack {
                // Alert 1
                Button {
                    showAlert1.toggle()
                } label: {
                    Text("Alert 1")
                }
                .padding()
                .alert("Alert title", isPresented: $showAlert1) {
                    Button("OK") {}
                } message: {
                    Text("This is an error")
                }
                
                // Alert 2
                Button(action: {
                    showAlert2.toggle()
                }, label: {
                    Text("Alert 2")
                })
                .padding()
                .alert(alertTitle, isPresented: $showAlert2) {
                    Button("Delete", role: .destructive) {
                        backgroundColor = .red
                    }
                    Button("Ok") { }
                    Button("Dismiss") { }
                }
                
                // Alert 3
                Button(action: {
                    showAlert3.toggle()
                }, label: {
                    Text("Alert3")
                })
                .padding()
                .alert(article.title,
                       isPresented: $showAlert3,
                       presenting: article) { article in
                    Button("Read") { }
                    Button("Cancel", role: .cancel) { }
                } message: { article in
                    Text(article.message)
                }
            }
        }
    }
}

struct Article: Identifiable {
    var id: String { title }
    let title: String
    let message: String
}

#Preview {
    AlertFunction()
    //AlertMethod()
}
