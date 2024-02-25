//
//  MatchGeoPractice1.swift
//  UIElements
//
//  Created by Tony Chen on 25/2/2024.
//

import SwiftUI

struct MatchGeoPractice1: View {
    
    @State private var selectedOption = optionList.home
    @Namespace private var selctedNameSpace
    
    enum optionList: String, CaseIterable, Identifiable {
        var id: Self {self}
        
        case home = "Home"
        case popula = "Popular"
        case other = "Other"
    }
    
    var body: some View {
        HStack {
            ForEach(optionList.allCases) { item in
                ZStack {
                    Text(item.rawValue)
                    
                    if selectedOption == item {
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "list", in: selctedNameSpace)
                    }
                    
                  
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring) {
                        selectedOption = item
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    MatchGeoPractice1()
}
