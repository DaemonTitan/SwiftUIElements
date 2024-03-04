//
//  WeakSelf.swift
//  UIElements
//
//  Created by Tony Chen on 29/2/2024.
//

import SwiftUI

struct WeakSelf: View {
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Second Screen") {
                weakSelfSecondScreen()
            }
            .navigationTitle("Screen 1")
        }
        .overlay {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
        }
    }
}

struct weakSelfSecondScreen: View {
    @StateObject var vm = WeakSelfSecondViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundStyle(.red)
            
            if let data = vm.data {
                Text(data.uppercased())
            }
            
        }
    }
}

class WeakSelfSecondViewModel: ObservableObject {
    @Published var data: String? = nil
    
    // When screen is initilised
    init() {
        print("Initialise Now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currentCount + 1, forKey: "count")
        getData()
    }
    
    // When screen is deinitilised
    deinit {
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currentCount - 1, forKey: "count")
        print("Deinitialise Now")
    }
    
    func getData() {
        // create strong reference to tell system this task needs keep active
//        DispatchQueue.global().async {
//            self.data = "New Data!!"
//        }
        
        // When 2nd screen loads, there will be N number of view model created, due to the string reference.
        // When use the strong reference, the viewm model won't deinit. It will deinit until the task completes.
//        DispatchQueue.main.asyncAfter(deadline: .now() + 500) {
//            self.data = "New Data!!"
//        }
        
        // Ignore the task, if task hasn't complete. There will not be N number of view model created. It will only be one view model.
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New Data!!"
        }
    }
}

#Preview {
    WeakSelf()
}
