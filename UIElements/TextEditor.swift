//
//  TextEditor.swift
//  UIElements
//
//  Created by Tony Chen on 31/1/2024.
//

import SwiftUI

struct TextEditors: View {
    
    @State var textBox = "Some text"
    @State var saveText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $textBox)
                    .frame(height: 250)
                    //.foregroundStyle(.pink)
                    .colorMultiply(Color(UIColor.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                Button(action: {
                    saveText = textBox
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                })
                Text(saveText)
                Spacer()
            }
            .padding()
            
            .navigationTitle("Text Editor")
        }
    }
}

#Preview {
    TextEditors()
}
