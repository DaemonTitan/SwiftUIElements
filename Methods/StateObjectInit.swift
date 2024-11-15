//
//  StateObjectInit.swift
//  UIElements
//
//  Created by Tony Chen on 14/11/2024.
//

import SwiftUI

struct Users {
    let name: String
}

class DashboardViewModel: ObservableObject {
    @Published var greeting: String
    
    init(name: String) {
        greeting = "Hello, \(name)!"
    }
}

struct StateObjectInit: View {
    //var user: User
    //@StateObject var vm = DashboardViewModel(name: user.name)
    @StateObject private var vm: DashboardViewModel
    
    init(name: String) {
        _vm = StateObject(wrappedValue: DashboardViewModel(name: name))
    }
    
    var body: some View {
        Text(vm.greeting)
    }
}

#Preview {
    StateObjectInit(name: "Tonuy")
}
