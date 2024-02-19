//
//  PopupSheets.swift
//  UIElements
//
//  Created by Tony Chen on 17/1/2024.
//

import SwiftUI

struct PopupSheets: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        
        ZStack {
            Color.green.ignoresSafeArea(.all)
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding(20)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
            })
            
            .sheet(isPresented: $showSheet,
                   content: {
                SecondScreen()
                    .presentationDetents([.fraction(0.1), .medium])
                    //.presentationDetents([.medium, .large])
                    .presentationDragIndicator(.hidden)
                    //.interactiveDismissDisabled()
            })
//            .onAppear(perform: {
//                showSheet = true
//            })
            
                       
//            .fullScreenCover(isPresented: $showSheet,
//                             content: {
//                SecondScreen()
//            })
            
        }
        
    }
}

struct SecondScreen: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red.ignoresSafeArea(.all)
            
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding(20)
            })
        }
    }
}

#Preview {
    PopupSheets()
    //SecondScreen()
}
