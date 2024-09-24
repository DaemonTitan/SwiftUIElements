//
//  SwfitGenerics.swift
//  UIElements
//
//  Created by Tony Chen on 24/9/2024.
//

import SwiftUI

struct StringModel {
    let info: String?
    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

struct BoolModel {
    let info: Bool?
    func removeInfo() -> BoolModel {
        return BoolModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        return GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stirngModel = StringModel(info: "Hello there")
    @Published var boolModel = BoolModel(info: true)
    
    @Published var genericStringModel = GenericModel(info: "Generic Data")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        stirngModel = stirngModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericView<T: View>: View {
    let title: String
    let content: T
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}

struct SwfitGenerics: View {
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(title: "New View", content: Text(" Generic View"))
            
            Text(vm.stirngModel.info ?? "No String Data")
            Text(vm.boolModel.info?.description ?? "No Bool Data")
            
            Text(vm.genericStringModel.info ?? "No Generic String Data")
            Text(vm.genericBoolModel.info?.description ?? "No Generic Bool Data")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    SwfitGenerics()
}
