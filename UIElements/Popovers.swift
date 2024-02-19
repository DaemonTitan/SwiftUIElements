//
//  Popovers.swift
//  UIElements
//
//  Created by Tony Chen on 6/2/2024.
//

import SwiftUI

struct Popovers: View {
    
    @State var showPopover: Bool = false
    @State var optionsList: [String] = [
        "Option 1",
        "Option 2",
        "Option 3"
    ]
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Button(action: {
                    showPopover.toggle()
                }, label: {
                    Text("Button")
                        
                })
                .padding(20)
                .background(Color.yellow)
//                .popover(isPresented: $showPopover, content: {
//                    Text("New Sheet")
//                })
//                .presentationCompactAdaptation(.sheet)
                
                .popover(isPresented: $showPopover, attachmentAnchor: .point(.top), content: {
                    VStack(alignment: .leading, spacing: 23, content: {
                        ForEach(optionsList, id: \.self) { option in
                            Button(action: {
                                
                            }, label: {
                                Text(option)
                                    
                            })
                            
                            if option != optionsList.last {
                                Divider()
                            }
                        }
                    })
                    .padding(20)
                    .presentationCompactAdaptation(.popover)
                })
            }
        }
    }
}

#Preview {
    Popovers()
}
