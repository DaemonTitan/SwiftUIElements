//
//  ToggleSwitch.swift
//  UIElements
//
//  Created by Tony Chen on 31/1/2024.
//

import SwiftUI

struct ToggleSwitch: View {
    @State var toggle = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggle ? "Online" : "Off line")
            }
            .font(.title)
            
            Toggle(isOn: $toggle,
                   label: {
                Text("Switch me")
            })
            .tint(Color.orange)
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    ToggleSwitch()
}
