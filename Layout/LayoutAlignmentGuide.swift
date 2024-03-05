//
//  LayoutAlignmentGuide.swift
//  UIElements
//
//  Created by Tony Chen on 5/3/2024.
//

import SwiftUI

struct LayoutAlignmentGuide: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hellow world!!")
                .background(Color.blue)
                // Update Text object and Vstack background at same time.
                .alignmentGuide(.leading, computeValue: { dimension in
                    //return 20
                    return dimension.width * 0.5
                })
            
            Text("This is some other text!")
                .background(Color.red)
        }
        .background(Color.orange)
    }
}

struct AlignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
        }
        .padding(16)
        .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10.0)))
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
                    //.opacity(showIcon ? 1 : 0)
            }
            
            Text(title)
            Spacer()
        }
        .alignmentGuide(.leading, computeValue: { dimension in
            return showIcon ? 40 : 0
        })
    }
}

#Preview {
    //LayoutAlignmentGuide()
    AlignmentChildView()
}
