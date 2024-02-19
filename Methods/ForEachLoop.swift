//
//  ForEachLoop.swift
//  UIElements
//
//  Created by Tony Chen on 16/1/2024.
//

import SwiftUI

struct ForEachLoop: View {
    let data: [String] = ["Apple", "Facebook", "Google", "Microsoft", "Tesla"]
    let myString: String = ""
    
    var body: some View {
        VStack {
            ForEach(data.indices) { index in
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("\(data[index]): \(index)")
                }
                .frame(width: 150,
                height: 30,
                       alignment: .leading)
            }
        }
        .padding()
    }
}

#Preview {
    ForEachLoop()
}
