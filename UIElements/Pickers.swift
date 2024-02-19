//
//  Pickers.swift
//  UIElements
//
//  Created by Tony Chen on 31/1/2024.
//

import SwiftUI

struct Pickers: View {
    @State var selection = "Most Recent"
    @State var selectNum = ""
    
    let optionList = [
        "Most Recent",
        "Most Popular",
        "Most Liked"
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        
        
        let attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.white,
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Age:")
                Text(selection)
            }
            
            Form {
                Picker(selection: $selection) {
                    ForEach(optionList, id: \.self) { option in
                        Text("\(option)")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .tag(option)
                    }
                } label: {
                    Text("Select")
                }
                .pickerStyle(MenuPickerStyle())

            }
            Spacer()
            
            //
            Picker(selection: $selectNum) {
                ForEach(0..<10) { num in
                    Text("\(num)")
                }
            } label: {
                Text("Select number")
            }
            .pickerStyle(WheelPickerStyle())
            Spacer()
            
            //
            Picker(selection: $selection) {
                ForEach(optionList, id: \.self) { option in
                    HStack {
                        Text("\(option)")
                            .tag(option)
                        Image(systemName: "heart.fill")
                        
                    }
                }
            } label: {
                Text("Select")
            }
            .colorMultiply(.black)
            Spacer()
            
            
            //
            Picker(selection: $selection) {
                ForEach(optionList, id: \.self) { option in
                    Text("\(option)")
                        .tag(option)
                }
            } label: {
                Text("Select")
            }
            .pickerStyle(SegmentedPickerStyle())
//            .colorMultiply(.white).colorInvert()
//            .colorMultiply(.orange).colorInvert()
            Spacer()
        }
    }
}

#Preview {
    Pickers()
}
