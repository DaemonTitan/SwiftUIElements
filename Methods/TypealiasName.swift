//
//  TypealiasName.swift
//  UIElements
//
//  Created by Tony Chen on 29/2/2024.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasName: View {
    @State var item: MovieModel = MovieModel(title: "Title", director: "Tom", count: 5)
    @State var tvItem: TVModel = TVModel(title: "TV title", director: "Michael", count: 3)
    
    var body: some View {
        VStack {
            Text(item.title)
            
            Text(item.director)
            
            Text("\(item.count)")
            
            Divider()
            
            Text(tvItem.title)
            
            Text(tvItem.director)
            
            Text("\(tvItem.count)")
            
        }
    }
}

#Preview {
    TypealiasName()
}
