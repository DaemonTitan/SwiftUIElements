//
//  ViewTransition1.swift
//  UIElements
//
//  Created by Tony Chen on 30/7/2024.
//

import SwiftUI

struct ViewTransition1: View {
    @State var showSheet: Bool = false
    @State var showView: Bool = false
    @State var showViewScreen: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.ignoresSafeArea()
                VStack {
                    Text("View 1")
                    SheetButton(showSheet: $showSheet)
    //                if showView {
    //                    ViewScreen()
    //                        .animation(.easeInOut, value: showView)
    //                        .transition(.slide)
    //                        .fullScreenCover(isPresented: $showView, content: ViewScreen.init)
    //                } else {
    //                    ButtonForView(showView: $showView)
    //                }
                    
                    ButtonForView(buttonActions: {
                        showViewScreen.toggle()
                    })
                    .fullScreenCover(isPresented: $showViewScreen, content: ViewScreen.init)
                    
                    NavigationButton()

                }
            }
        }
    }
}

struct SheetButton: View {
    @Binding var showSheet: Bool
    
    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Go to View 2 with Sheet")
        })
        .sheet(isPresented: $showSheet, content: {
            View2()
        })

    }
}

struct ButtonForView: View {
    let buttonActions: () -> Void
    
    var body: some View {
        Button(action: buttonActions,
               label: {
            Text("Go to View Screen")
        })
    }
}

struct ViewScreen: View {
    @Environment(\.dismiss) var close
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("View Screen")
            }
            .navigationTitle("View Screen")
            .background(Color(.blue))
        }
        .ignoresSafeArea()
        .onTapGesture {
            close()
        }
    }
}

struct NavigationButton: View {
    var body: some View {
        NavigationLink {
            View2()
        } label: {
            Text("Navigation to View 2")
        }
    }
}

struct View2: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("View 2")
            }
            .navigationTitle("View 2")
            .background(Color(.blue))
        }
        .ignoresSafeArea()
        .onTapGesture {
            dismiss()
        }
    }
}

#Preview {
    ViewTransition1()
}
