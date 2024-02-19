//
//  TabBarCustom.swift
//  UIElements
//
//  Created by Tony Chen on 27/1/2024.
//

import SwiftUI

struct TabBarCustom: View {
    @State var selectedIndex = 0
    @State var presented = false
    
    let icon = [
        "house",
        "gear",
        "plus",
        "lasso",
        "message",
    ]
    
    var body: some View {
        VStack {
            // Content
            ZStack {
                Spacer().fullScreenCover(isPresented: $presented, content: {
                    Button(action: {
                        presented.toggle()
                    }, label: {
                        Text("Cancel")
                            .background(Color.red)
                    })
                })
                
                switch selectedIndex {
                case 0:
                    NavigationStack {
                        VStack {
                            Text("Home Screen")
                        }
                        .navigationTitle("Home")
                    }
                case 1:
                    NavigationStack {
                        VStack {
                            Text("Setting Screen")
                        }
                        .navigationTitle("Settings")
                    }
                case 2:
                    NavigationStack {
                        VStack {
                            Text("Add Screen")
                        }
                        .navigationTitle("Add")
                    }
                case 3:
                    NavigationStack {
                        VStack {
                            Text("Edit Screen")
                        }
                        .navigationTitle("Edit")
                    }
                default:
                    NavigationStack {
                        VStack {
                            Text("Message Screen")
                        }
                        .navigationTitle("Message")
                    }
                }
            }
            
            Divider()
            HStack {
                ForEach(0..<5, id: \.self) { num in
                    Spacer()
                    Button(action: {
                        if num == 2 {
                            presented.toggle()
                        } else {
                            self.selectedIndex = num
                        }
                    }, label: {
                        if num == 2 {
                            Image(systemName: icon[num])
                                .font(.system(size: 40,
                                              weight: .medium,
                                              design: .default))
                                .frame(width: 60,
                                        height: 60)
                                .foregroundStyle(.white)
                                .background(.blue)
                                .clipShape(Circle())

                        } else {
                            Image(systemName: icon[num])
                                .font(.system(size: 25,
                                              weight: .medium,
                                              design: .default))
                                .foregroundStyle(selectedIndex == num ? Color(.label) : Color(UIColor.lightGray))
                        }
                    })
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    TabBarCustom()
}
