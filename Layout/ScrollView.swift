//
//  ScrollView.swift
//  UIElements
//
//  Created by Tony Chen on 16/1/2024.
//

import SwiftUI

struct ScrollViews: View {
    var body: some View {
        //VerticalScrollViews()
        //HoricontalScrollViews()
        ComplexScrollViews()
    }
}


struct VerticalScrollViews: View {
    var body: some View {
        ScrollView(.vertical, content: {
            VStack{
                ForEach(0..<20) { index in
                    Rectangle()
                        .fill(
                            //Color(.blue)
                            AngularGradient.init(
                                gradient: Gradient(
                                    colors: [Color.red, Color.blue]),
                                center: .topLeading,
                                angle: .degrees(225))
                        )
                        .frame(width: 300,
                               height: 200)
                }
            }
        })
        .scrollIndicators(.hidden)
    }
}

struct HoricontalScrollViews: View {
    var body: some View {
        ScrollView(.horizontal, content: {
            HStack{
                ForEach(0..<20) { index in
                    Rectangle()
                        .fill(
                            AngularGradient.init(
                                gradient: Gradient(
                                    colors: [Color.red, Color.blue]),
                                center: .topLeading,
                                angle: .degrees(225))
                        )
                        .frame(width: 300,
                               height: 200)
                }
            }
        })
        .scrollIndicators(.hidden)
    }
}

struct ComplexScrollViews: View {
    var body: some View {
        
        ScrollView(.vertical, content: {
            VStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal,content: {
                        HStack {
                            ForEach(0..<5) { index in
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(
                                        AngularGradient.init(
                                            gradient: Gradient(
                                                colors: [Color.red, Color.blue]),
                                            center: .topLeading,
                                            angle: .degrees(225)))
                                    .frame(width: 200,
                                           height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    })
                }
            }
        })
        .scrollIndicators(.hidden)
    }
}


#Preview {
    ScrollViews()
}
