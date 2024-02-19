//
//  PageNavigation.swift
//  UIElements
//
//  Created by Tony Chen on 18/1/2024.
//

import SwiftUI

struct PageNavigation: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink(destination: MyNewScreen(),
                               label: {
                    Text("Next buttom")
                })
                
                Text("Hellow, World!")
                Text("Hellow, World!")
            }
            .navigationTitle("All Inboxes")
            //.navigationBarTitleDisplayMode(.automatic)
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MyNewScreen()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .foregroundStyle(.red)
                    
                }
            }
        }
    }
}

struct MyNewScreen: View {
    @Environment (\.dismiss) var dismissView
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(.all)
                .navigationTitle("Green Screen")
                //.toolbar(.hidden)
            
            VStack {
                Button("GO BACK") {
                    dismissView()
                }
                .padding()
                NavigationLink(destination: Text("Third Screen"),
                               label: {Text("Click here")})
            }
        }
    }
}

#Preview {
    PageNavigation()
}
