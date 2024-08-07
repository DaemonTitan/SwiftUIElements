//
//  ListView.swift
//  UIElements
//
//  Created by Tony Chen on 6/8/2024.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
}

var fruits = [
    Item(name: "apple"),
    Item(name: "orange"),
    Item(name: "banana"),
    Item(name: "pear"),
    Item(name: "watermelon"),
    Item(name: "rockmelon")
]

var fruitsArray: [String] = [
    "apple",
    "orange",
    "banana",
    "pear",
    "watermelon",
    "rockmelon"
]

struct ListView: View {
    var body: some View {
        NavigationStackSheetScreen()
        //NavigationStackSheetToggle()
        //NavigationStackNavigationLink()
        //CustomiseSheetPopup()
    }
}

struct NavigationStackSheetScreen: View {
    @State private var searchText: String = ""
    @State private var selectedItem: Item?
    var filteredItem: [Item] {
        return fruits.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredItem) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedItem = item
                }
            }
            .overlay {
                if filteredItem.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
            .navigationTitle("Fruit")
            .searchable(text: $searchText, prompt: "Search fruit")
            .sheet(item: $selectedItem) { item in
                ItemView1(itemName: item.name)
            }
        }
    }
}

struct NavigationStackSheetToggle: View {
    @State private var searchText: String = ""
    @State private var showSheet: Bool = false
    @State private var selectedItem: Item?
    var searchResult: [Item] {
        return fruits.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List(searchResult) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedItem = item
                    showSheet.toggle()
                }
            }
            .overlay {
                if searchResult.isEmpty {
                    ContentUnavailableView {
                        Label("No Mail", systemImage: "tray.fill")
                    } description: {
                        Text("New mails you receive will appear here.")
                    }
                }
            }
            .navigationTitle("Fruit")
            .searchable(text: $searchText, prompt: "Search fruit")
            .sheet(isPresented: $showSheet, content: {
                if let selectItem = selectedItem {
                    ItemView2(itemName: selectItem)
                }
            })
        }
    }
}

struct NavigationStackNavigationLink: View {
    @State private var searchText: String = ""
    @State private var showSheet: Bool = false
    @State private var selectedItem: Item?
    var filteredItem: [Item] {
        return fruits.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredItem) { item in
                ZStack(alignment: .leading) {
                    Text(item.name)
                    NavigationLink(destination: ItemViewNavigationLink(itemName: item)) {
                        EmptyView()
                            
                    }
                    .opacity(0)
                }
                //.listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Fruit")
            .searchable(text: $searchText, prompt: "Search fruit")
            
        }
    }
}

struct CustomiseSheetPopup: View {
    @State private var searchText: String = ""
    @State private var showSheet: Bool = false
    @State private var selectedItem: Item?
    var filteredItem: [Item] {
        return fruits.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredItem) { item in
                HStack {
                    Text(item.name)
                }
            }
            .navigationTitle("Fruit")
            .searchable(text: $searchText, prompt: "Search fruit")
        }
    }
}

struct ItemView1: View {
    var itemName: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(itemName)").bold()
            }
        }
        .onTapGesture {
            dismiss()
        }
    }
}

struct ItemView2: View {
    var itemName: Item
    @Environment(\.dismiss) var dismisss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(itemName.name)").bold()
            }
        }
        .onTapGesture {
            dismisss()
        }
    }
}

struct ItemViewNavigationLink: View {
    var itemName: Item
    @Environment(\.dismiss) var dismisss
    
    var body: some View {
        VStack {
            Text("\(itemName.name)").bold()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismisss()
                }, label: {
                    Label("Back", systemImage: "arrow.left.circle")
                })
            }
        }
    }
}

// When navigationBarBackButtonHidden set to True, use this function to allow user swip to previous view.
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

#Preview {
    ListView()
}
