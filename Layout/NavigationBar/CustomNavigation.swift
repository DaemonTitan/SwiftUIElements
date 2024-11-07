//
//  CustomNavigation.swift
//  UIElements
//
//  Created by Tony Chen on 7/11/2024.
//

import SwiftUI

struct CustomNavigation: View {
    
    @State var isScroll: Bool = false
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                //Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear.preference(key: ScrollPathKey.self,
                                       value: proxy.frame(in: .named("scroll")).minY)
            }

            
            ForEach(0..<15) { item in
                content
            }
        }
        .coordinateSpace(name: "scroll")
        
        .onPreferenceChange(ScrollPathKey.self, perform: { value in
            withAnimation(.default) {
                if value < 0 {
                    isScroll = true
                } else {
                    isScroll = false
                }
            }
        })
        
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 30)
        })
        
        .overlay {
            ZStack {
                Color.clear
                    .frame(height: isScroll ? 90 : 100)
                    .background(.ultraThinMaterial)
                    .opacity(isScroll ? 1: 0)
                    .blur(radius: 10)
                    .ignoresSafeArea()
                
                HStack {
                    Text("Feature")
                        .font(isScroll ? .system(size: 22) : .system(size: 35).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "gear")
                        .font(isScroll ? .title : .largeTitle)
                        .padding(.bottom, 6)
                }
                .offset(y: isScroll ? -30 : -25)
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        
        
    }
    
    var content: some View {
        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .foregroundStyle(Color(.lightGray))
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
            .padding()
            .overlay {
                VStack(alignment: .leading) {
                    Circle()
                        .frame(height: 60)
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 300, height: 20)
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 300, height: 20)
                }
                .padding()
            }
    }
}

#Preview {
    CustomNavigation()
}
