//
//  CustomNavigationBar.swift
//  UIElements
//
//  Created by Tony Chen on 7/11/2024.
//

import SwiftUI

struct ScrollPathKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct CustomNavigationBar: View {
    var body: some View {
        CustomNavigationBar1()
        //CustomNavigationBar2()
    }
}

struct CustomNavigationBar1: View {
    @State var isScroll: Bool = false
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear.preference(key: ScrollPathKey.self,
                                       value: proxy.frame(in: .named("scroll")).minY)
            }
            .onPreferenceChange(ScrollPathKey.self, perform: { value in
                withAnimation(.default) {
                    if value < 0 {
                        isScroll = true
                    } else {
                        isScroll = false
                    }
                }
            })
            ColumnAndGrid()
                .padding()
        }
        .coordinateSpace(name: "scroll")
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
//                    Image(systemName: "gear")
//                        .font(isScroll ? .title : .largeTitle)
//                        .padding(.bottom, 6)
                    
                    
                }
                .offset(y: isScroll ? -30 : -25)
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct CustomNavigationBar2: View {
    
       @State var scrollViewOffset: CGFloat = 0
       
       let columns: [GridItem] = [
           GridItem(.flexible(), spacing: 6, alignment: nil),
           GridItem(.flexible(), spacing: 6, alignment: nil),
           GridItem(.flexible(), spacing: 6, alignment: nil),
       ]
    
    var body: some View {
        ScrollView {
                VStack {
                    Text("Feature")
                        .font(.system(size: 35).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: -25)
                        .padding(.horizontal)
                        .opacity(Double(scrollViewOffset) / 97)
                        .background(
                            GeometryReader { proxy in
                                Text("\(proxy.frame(in: .global).minY)")
                                .preference(key: ScrollPathKey.self,
                                                       value: proxy.frame(in: .global).minY)
                            }
                        )
                        .onPreferenceChange(ScrollPathKey.self, perform: { value in
                            self.scrollViewOffset = value
                        })
                    
                    LazyVGrid(columns: columns,
                              alignment: .center,
                              spacing: 6,
                              pinnedViews: [.sectionHeaders],
                              content: {
                        Section {
                            ForEach(0..<5) { index in
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(height: 150)
                            }
                        } header: {
                            Text("Section 1")
                                .font(.title)
                                .foregroundStyle(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.red)
                                .padding()
                        }
                    })
                }
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 30)
            })
            .overlay(content: {
                Text("\(scrollViewOffset)")
            })
            .overlay {
                ZStack {
                    Color.clear
                        .frame(height: 100)
                        .background(.ultraThinMaterial)
                        .blur(radius: 10)
                        .ignoresSafeArea()
                    
                    HStack {
                        Text("Feature")
                            .font(.system(size: 22))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .offset(y: -30)
                    .padding(.horizontal)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .opacity(scrollViewOffset < 50 ? 1 : 0)
            }
    }
}

#Preview {
    CustomNavigationBar()
}
