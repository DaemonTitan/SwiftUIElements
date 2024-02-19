//
//  ViewModel.swift
//  UIElements
//
//  Created by Tony Chen on 1/2/2024.
//

import SwiftUI

struct fruitModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published  var fruitArray: [fruitModel] = []
    @Published var isLoading = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = fruitModel(name: "Orange", count: 2)
        let fruit2 = fruitModel(name: "Banana", count: 10)
        let fruit3 = fruitModel(name: "Watermelon", count: 7)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    }
    
    func deleteFruits(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct ViewModel: View {
    // Same as observedObject, but the object will presists when it reflash, and data will presits on the object.
    // Use this on the view when it is first time create.
    @StateObject var fruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundStyle(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruits)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            
            .toolbar() {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        RandomScreen(fruitViewModel: fruitViewModel)
                    } label: {
                        Image(systemName: "arrow.right")
                    }
                }
            }
        }
    }
}

struct RandomScreen: View {
    @Environment(\.dismiss) var goBack
    
    // To observe the model is changed. If the view reflashed (reload), this object will also reflashed and item in this object will be reflashed and may cause data not appear.
    // Use this for subview when it is passed to another view.
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundStyle(.white)
                        Text(fruit.name)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    ViewModel()
    //RandomScreen()
}
