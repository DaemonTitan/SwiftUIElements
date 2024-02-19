//
//  Practise2.swift
//  UIElements
//
//  Created by Tony Chen on 16/1/2024.
//

import SwiftUI

struct Practise2: View {
    
    let flower: Flower
    let title: String
    let bodyText: String
    
    init(flower: Flower) {
        self.flower = flower
        
        if flower == .Rose {
            self.title = "Rose"
            self.bodyText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula .eget dolor. Aenean m"
        } else {
            self.title = "Lily"
            self.bodyText = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula .eget dolor. Aenean m"
        }
    }
    
    enum Flower {
        case Rose
        case Lily
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(
                    LinearGradient(gradient: Gradient(
                        colors: [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))]),
                                   startPoint: .topLeading, endPoint: .trailing)
                )
                .shadow(color: Color.black.opacity(0.5),
                        radius: 15,
                        x: 0,
                        y: 10)
                .frame(width: 300,
                       height: 400)
            VStack {
                Spacer()
                Image("Flower")
                    .resizable()
                    .frame(width: 300,
                           height: 200)
                    .clipShape(Circle())
                VStack {
                    Text(title.capitalized)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text(bodyText)
                        .multilineTextAlignment(.leading)
                        .kerning(2.0)
                        .baselineOffset(2.0)
                        .padding(.horizontal)
                }
                Spacer()
            }
            .foregroundStyle(Color.white)
            .frame(width: 300,
                   height: 400)
            
        }
        
    }
}

#Preview {
    Practise2(flower: .Lily)
}
