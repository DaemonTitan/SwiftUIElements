//
//  MatchedGeometry.swift
//  UIElements
//
//  Created by Tony Chen on 25/2/2024.
//

import SwiftUI

struct MatchedGeometry: View {
    @State private var isClicked = false
    @Namespace private var nameSpace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 100, height: 100)
    //                .offset(y: isClicked ?
    //                        UIScreen.main.bounds.height * 0.75 : 0)
            }
            Spacer()
            if isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 300, height: 100)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometrySample2: View {
    let categories = [
        "Home",
        "Popular",
        "Saved"
    ]
    
    @State private var selectedCategory = "Home"
    @Namespace private var newNameSpace
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selectedCategory == category {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "test", in: newNameSpace)
                            .frame(width: 50, height: 2)
                            .offset(y: 20)
                    }
                    Text(category)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring) {
                        selectedCategory = category
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    //MatchedGeometry()
    MatchedGeometrySample2()
}
