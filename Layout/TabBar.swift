//
//  TabBar.swift
//  UIElements
//
//  Created by Tony Chen on 23/1/2024.
//

import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: Int
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red
                VStack {
                    Button(action: {
                        selectedTab = 1
                    }, label: {
                        Text("Go to Setting")
                            .font(.headline)
                            .frame(width: 150, height: 50)
                            .foregroundStyle(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    })
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct SettingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.yellow

            }
            .navigationTitle("Setting")
        }
    }
}

struct TabBar: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(1)
        }
    }
}

#Preview {
    TabBar()
}
