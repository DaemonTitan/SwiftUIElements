//
//  ListFunction.swift
//  UIElements
//
//  Created by Tony Chen on 20/1/2024.
//

import SwiftUI

struct ListFunction: View {
    @State var fruits: [String] = [
        "apple",
        "orange",
        "banana",
        "pear",
        "watermelon",
        "rockmelon"
    ]
    @State var veggies: [String] = [
        "tomato",
        "potato",
        "carrot",
        "onion",
        "Capsicum"
    ]
    
    @State var meats: [String] = [
        "steak",
        "check breast",
        "beef steak",
        "check wing",
        "roast beef",
        "lamb steak",
        "lamb cutlet"
    ]
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .foregroundStyle(Color.white)
                    }
    //                .onDelete(perform: { indexSet in
    //                    deleteData(indexSet: indexSet)
    //                })
//                    .onMove(perform: { indices, newOffset in
//                        moveData(indices: indices, newOffset: newOffset)
//                    })
                    
                    .onDelete(perform: deleteData)
                    .onMove(perform: moveData)
                    .listRowBackground(Color.pink)
                } header: {
                    HStack {
                        Text("Fruits")
                        Image(systemName: "apple.logo")
                    }
                    .foregroundStyle(Color.purple)
                }
                Section {
                    ForEach(fruits, id: \.self) { veggie in
                        Text(veggie.capitalized)
                    }
                } header: {
                    Text("Veggies")
                        .foregroundStyle(Color.orange)
                }
                Section {
                    ForEach(meats, id: \.self) { meat in
                        Text(meat.capitalized)
                    }
                } header: {
                    Text("Meats")
                        .foregroundStyle(Color.brown)
                }

            }
            .listStyle(DefaultListStyle())
            .navigationTitle("Grocery List")
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    addButton
                }
            }
            .toolbarTitleMenu {
                Button {
                    
                } label: {
                    Text("Screen 1")
                }
                
                Button {
                    
                } label: {
                    Text("Screen 2")
                }

            }
        }
        .tint(Color.red)
    }
    
    var addButton: some View {
        Button(action: {
            addData()
        }, label: {
            Text("Add")
        })
    }
    
    func deleteData(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func moveData(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addData() {
        fruits.append("Watermelon")
    }
}



#Preview {
    ListFunction()
}
