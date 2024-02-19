//
//  BackgroundAndOverlay.swift
//  UIElements
//
//  Created by Tony Chen on 15/1/2024.
//

import SwiftUI

struct BackgroundAndOverlay: View {
    var body: some View {
        VStack(spacing: 80) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 100,
                       height: 100,
                       alignment: .center)
                .background(
                    LinearGradient(gradient: Gradient(
                        colors: [Color.red, Color.blue]),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                )
            //.padding(50)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(
                    Circle()
                        .fill(
                            //Color.blue
                            LinearGradient(gradient: Gradient(
                                colors: [Color.red, Color.blue]),
                                           startPoint: .leading,
                                           endPoint: .trailing))
                        .frame(width: 100,
                               height: 100,
                               alignment: .center)
                )
                .background(
                    Circle()
                        .fill(
                            //Color.red
                            LinearGradient(gradient: Gradient(
                                colors: [Color.blue, Color.red]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .frame(width: 120,
                               height: 120,
                               alignment: .center)
                )
            
            Circle()
                .fill(Color.pink)
                .frame(width: 100,
                       height: 100)
                .overlay(
                    Text("1")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                )
                .background(
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 120,
                               height: 120)
                )
            
            Rectangle()
                .frame(width: 100,
                       height: 100)
                .overlay(
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 50,
                               height: 50)
                    , alignment: .topLeading
                )
                .background(
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 150,
                               height: 150)
                    , alignment: .bottomTrailing
                )
            
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundStyle(Color.white)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.blue, Color.purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .frame(width: 100,
                               height: 100)
                        .shadow(color: Color.purple.opacity(0.5),
                                radius: 10,
                                x: 0.0,
                                y: 10)
                        .overlay(
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 35,
                                      height: 35)
                                .overlay(
                                    Text("10")
                                        .font(.headline)
                                        .foregroundStyle(Color.white)
                                )
                                .shadow(color: Color.purple.opacity(0.5),
                                        radius: 10,
                                        x: 0.0,
                                        y: 5)
                            , alignment: .bottomTrailing
                        )
                )
            
        }
        
    }
}

#Preview {
    BackgroundAndOverlay()
}
