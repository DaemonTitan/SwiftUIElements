//
//  Labels.swift
//  UIElements
//
//  Created by Tony Chen on 23/1/2024.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var title: String
    var systemImageName: String
}

struct Labels: View {
    let item: [MenuItem] = [
        MenuItem(title: "Home", systemImageName: "house"),
        MenuItem(title: "Profile", systemImageName: "person.circle"),
        MenuItem(title: "Activity", systemImageName: "bell"),
        MenuItem(title: "Setting", systemImageName: "gear"),
        MenuItem(title: "Airplane", systemImageName: "airplane"),
        MenuItem(title: "Rate app", systemImageName: "star")
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ForEach(item) { item in
                    Label(
                        title: { Text(item.title) },
                        icon: { Image(systemName: item.systemImageName) }
                    )
                    .font(.system(size: 32,
                                  weight: .bold,
                                  design: .default))
                    .foregroundStyle(Color.blue)
                    .padding()
                    Divider()
                }
                Spacer()
            }
            .navigationTitle("Labels")
        }
    }
}

#Preview {
    Labels()
}
