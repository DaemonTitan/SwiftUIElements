//
//  Texts.swift
//  UIElements
//
//  Created by Tony Chen on 15/1/2024.
//

import SwiftUI

struct Texts: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Hello, World!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.cyan)
                .underline(true, color: Color.red)
                .strikethrough(true, color: Color.black)
                .padding()
            
            Text("Lorem ipsum dolor sit amet, co".capitalized)
                .font(.system(size: 15,
                              weight: .medium,
                              design: .monospaced))
                .frame(width: 80,
                       height: 80,
                       alignment: .center)
                .minimumScaleFactor(0.1)
                .padding()
            
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.")
                .frame(width: 300,
                        height: 100,
                       alignment: .center)
                .baselineOffset(5.0)
                .kerning(2.0)
                .padding(.all)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.8)
                .border(.black)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Lorem ipsu".capitalized)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula .eget dolor. Aenean m")
            }
            .padding(.all)
            .padding(.leading)
            .padding(.trailing)
            .background(
                Color.white.clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .shadow(color: .gray.opacity(0.5), 
                            radius: 10,
                            x: 0.0,
                            y: 10
                        ))
        }
    }
}

#Preview {
    Texts()
}
