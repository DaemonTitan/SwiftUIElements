//
//  AsynicImages.swift
//  UIElements
//
//  Created by Tony Chen on 5/2/2024.
//

import SwiftUI

struct AsynicImages: View {
    
    let url = URL(string: "https://picsum.photos/400")
    var body: some View {
//        AsyncImage(url: url) { returnedImage in
//            returnedImage
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .clipShape(RoundedRectangle(cornerRadius: 10.0))
//        } placeholder: {
//            ProgressView()
//        }
        
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let returnedImage):
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }


    }
}

#Preview {
    AsynicImages()
}
