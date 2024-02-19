//
//  SwiftUIScrollViewReader.swift
//  UIElements
//
//  Created by Tony Chen on 30/1/2024.
//

import SwiftUI

struct SwiftUIScrollViewReader: View {
    var body: some View {
        NavigationStack {
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(alignment: .leading) {
                        Button(action: {
                            withAnimation {
                                scrollView.scrollTo(999, anchor: .center)
                            }
                        }, label: {
                            Text("Scroll to Bottom")
                        })
                        ForEach(0...1000, id: \.self) { num in
                            HStack {
                                Label (
                                    title: { Text("Position: \(num)") },
                                    icon: { Image(systemName: "house") }
                                )
                                Spacer()
                            }
                            .id(num)
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("Scroll View")
        }
    }
}

#Preview {
    SwiftUIScrollViewReader()
}
