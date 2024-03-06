//
//  HashableData.swift
//  UIElements
//
//  Created by Tony Chen on 6/3/2024.
//

import SwiftUI

struct identifiableModel: Identifiable {
    let id = UUID()
    let title: String
}

struct HashableModel: Hashable {
    let newTitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(newTitle)
    }
}

struct HashableData: View {
    
    private let data: [String] = [
        "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX",
    ]
    
    private let identifiableData: [identifiableModel] = [
        identifiableModel(title: "ONE"),
        identifiableModel(title: "TWO"),
        identifiableModel(title: "THREE"),
        identifiableModel(title: "FOUR"),
        identifiableModel(title: "FIVE"),
        identifiableModel(title: "SIX")
    ]
    
    private let hashaData: [HashableModel] = [
        HashableModel(newTitle: "ONE"),
        HashableModel(newTitle: "TWO"),
        HashableModel(newTitle: "THREE"),
        HashableModel(newTitle: "FOUR"),
        HashableModel(newTitle: "FIVE"),
        HashableModel(newTitle: "SIX")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // String confrom to hashable protocol
//                ForEach(newData, id: \.self) { item in
//                    Text(item)
//                        .font(.headline)
//                }
                
//                ForEach(identifiableData) { item in
//                    Text(item.title)
//                        .font(.headline)
//                }
                
                ForEach(hashaData, id: \.self) { item in
                    Text(item.newTitle)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableData()
}
