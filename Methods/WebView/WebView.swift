//
//  WebView.swift
//  UIElements
//
//  Created by Tony Chen on 12/2/2024.
//

import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    let url: URL?
    
    // Create URL View
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(frame: .zero, configuration: config)
    }
    // Load URL for the view
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else { return }
        let request = URLRequest(url: myURL)
        uiView.load(request)
    }
}
