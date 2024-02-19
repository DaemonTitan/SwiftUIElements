//
//  ColumnAndGrid.swift
//  UIElements
//
//  Created by Tony Chen on 16/1/2024.
//

import SwiftUI

struct ColumnAndGrid: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
    ]
    
    var body: some View {
        ScrollView{
            Rectangle()
                .fill(Color.gray)
                .frame(height: 400)
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders],
                      content: {
                Section {
                    ForEach(0..<5) { index in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 150)
                    }
                } header: {
                    Text("Section 1")
                        .font(.title)
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.red)
                        .padding()
                }
                Section {
                    ForEach(0..<6) { index in
                        Rectangle()
                            .fill(Color.green)
                            .frame(height: 150)
                    }
                } header: {
                    Text("Section 2")
                        .font(.title)
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.yellow)
                        .padding()
                }
            })
        }
    }
}

#Preview {
    ColumnAndGrid()
}
