//
//  WebContentView.swift
//  UIElements
//
//  Created by Tony Chen on 12/2/2024.
//

import SwiftUI

struct WebContentView: View {
    var body: some View {
        NavigationStack {
            SwiftUIWebView(url: URL(string: "https://www.apple.com"))
                .navigationTitle("Web View")
        }
    }
}

#Preview {
    WebContentView()
}
