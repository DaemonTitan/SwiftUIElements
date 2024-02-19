//
//  AppStorages.swift
//  UIElements
//
//  Created by Tony Chen on 2/2/2024.
//

import SwiftUI

struct AppStorages: View {
    
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add name here")
            Button(action: {
                let name = "Tony"
                currentUserName = name
            }, label: {
                Text("Button".uppercased())
            })
        }

    }
}

#Preview {
    AppStorages()
}
