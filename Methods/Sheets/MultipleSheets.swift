//
//  MultipleSheets.swift
//  UIElements
//
//  Created by Tony Chen on 27/2/2024.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID()
    let title: String
}

// Problem: when click the button, New title always appear in first time
// Solution:
// 1. Use Binding in SheetScreen
// 2. Use multiple sheets - sheet is not in the same hericy.
// 3. use $item

struct MultipleSheetsProblem: View {
    
    @State private var selectedModel: RandomModel = RandomModel(title: "New title")
    @State private var showSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                selectedModel = RandomModel(title: "Title ABC")
                showSheet.toggle()
            }, label: {
                Text("Button 1")
            })
            
            Button(action: {
                selectedModel = RandomModel(title: "Title DEF")
                showSheet.toggle()
            }, label: {
                Text("Button 2")
            })
        }
        .sheet(isPresented: $showSheet, content: {
            SheetScreen(selectedModel: selectedModel)
        })
    }
}


struct MultipleSheetsSolution1: View {
    
    @State private var selectedModel: RandomModel = RandomModel(title: "New title")
    @State private var showSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                selectedModel = RandomModel(title: "Title ABC")
                showSheet.toggle()
            }, label: {
                Text("Button 1")
            })
            
            Button(action: {
                selectedModel = RandomModel(title: "Title DEF")
                showSheet.toggle()
            }, label: {
                Text("Button 2")
            })
        }
        .sheet(isPresented: $showSheet, content: {
            SheetScreenBind(selectedModel: $selectedModel)
        })
    }
}

struct SheetScreenBind: View {
    @Binding var selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.title)
    }
}

struct MultipleSheetsSolution2: View {
    @State private var selectedModel: RandomModel = RandomModel(title: "New title")
    @State private var showSheet = false
    @State private var showSheet2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button 1")
            })
            .sheet(isPresented: $showSheet, content: {
                SheetScreen(selectedModel: RandomModel(title: "Title ABC"))
            })
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button 2")
            })
            .sheet(isPresented: $showSheet2, content: {
                SheetScreen(selectedModel: RandomModel(title: "Title DEF"))
            })
        }
    }
}

struct MultipleSheetsSolution3: View {
    @State private var selectedModel: RandomModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<30) { index in
                    Button(action: {
                        selectedModel = RandomModel(title: "Title \(index)")
                    }, label: {
                        Text("Button \(index)")
                    })
                }
            }
            .frame(maxWidth: .infinity)
        }
        .sheet(item: $selectedModel) { model in
            SheetScreen(selectedModel: model)
        }
    }
}

struct SheetScreen: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.title)
    }
}

#Preview {
    //MultipleSheetsProblem()
    //MultipleSheetsSolution1()
    //MultipleSheetsSolution2()
    MultipleSheetsSolution3()
}
