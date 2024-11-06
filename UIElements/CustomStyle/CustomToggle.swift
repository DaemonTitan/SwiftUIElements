//
//  CustomToggle.swift
//  UIElements
//
//  Created by Tony Chen on 6/11/2024.
//

import SwiftUI

struct CustomToggle: View {
    @State var isOn1: Bool = false
    @State var isOn2: Bool = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isOn1) {
                Text("Toggle1")
                    .foregroundStyle(.white)
            }
            .toggleStyle(CustomToggleStyle1())
            
            Toggle(isOn: $isOn2) {
                Text("Toggle2")
                    .foregroundStyle(.white)
            }
            .toggleStyle(CustomToggleStyle2())

            
        }
    }
}

struct CustomToggleStyle1: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        return ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: 140, height: 50)
                .foregroundStyle(isOn ? .blue : .gray)
                .overlay(alignment: .leading, content: {
                    Image("Star")
                        .resizable()
                        .frame(width: 300, height: 100)
                        .offset(x: isOn ? -100 : 0)
                        .opacity(isOn ? 0 : 1)
                    Image("Flower")
                        .resizable()
                        .frame(width: 300, height: 100)
                        .offset(x: isOn ? 35 : 135)
                        .opacity(isOn ? 1 : 0)
                })
                .overlay {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.white)
                        .offset(x: isOn ? -44 : 44)
                }
        }
        .mask({
            RoundedRectangle(cornerRadius: 40)
        })
        .onTapGesture {
            withAnimation(.spring) {
                configuration.isOn.toggle()
            }
        }
    }
}

struct CustomToggleStyle2: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        return ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: isOn ? 150 : 50, height: 50)
                .foregroundStyle(Color(.lightGray).shadow(.inner(radius: 5)))
            Circle()
                .foregroundStyle(.white)
                .frame(width: 35, height: 35)
                .padding(.horizontal, 8)
                .overlay {
                    Image(systemName: "dollarsign")
                        .font(.headline)
                        .foregroundStyle(.black)
                        
                }

        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .onTapGesture {
            withAnimation(.spring) {
                configuration.isOn.toggle()
            }
        }
    }
}

#Preview {
    CustomToggle()
}
