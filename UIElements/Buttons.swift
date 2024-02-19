//
//  Buttons.swift
//  UIElements
//
//  Created by Tony Chen on 15/1/2024.
//

import SwiftUI

struct Buttons: View {
    @State var title: String = "This is title"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            
            // Next button
            Button(action: {
                self.title = "Next tapped"
            }, label: {
                Text("Next")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
            })
            .buttonStyle(.bordered)
            //.buttonBorderShape(.capsule)
            //.buttonBorderShape(.circle)
            .buttonBorderShape(.roundedRectangle(radius: 10.0))
            
            // Save button
            Button(action: {
                self.title = "Save tapped"
            }, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.light)
                    .padding()
                    .padding(.horizontal, 20)
                    .foregroundStyle(.white)
                    .background(
                        Color.blue
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/))
            })
            
            // Heart button
            Button(action: {
                self.title = "Cancel tapped"
            }, label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 70,
                           height: 70)
                    .shadow(radius: 10)
                    .overlay(
                            Image(systemName: "heart.fill"))
                    .font(.largeTitle)
                    .foregroundStyle(Color(.red))
                
            })
            
            // Finish button
            Button(action: {
                self.title = "Finish tapped"
            }, label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundStyle(Color.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.0)
                        )
            })
            
            // Pause button
            Button(action: {
                self.title = "Pause tapped"
            }, label: {
                Label("Learn more", systemImage: "book.fill")
            })
            .buttonStyle(.bordered)
            //.buttonStyle(.borderedProminent)
            //.foregroundStyle(.pink)
            .tint(.pink)
        }
    }
}

#Preview {
    Buttons()
}
