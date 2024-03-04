//
//  BKThread.swift
//  UIElements
//
//  Created by Tony Chen on 29/2/2024.
//

import SwiftUI

// Thread 1 is main thread.
// Tasks can run in backgound: connect to API, fetch data, save data, delete data.
// Anything doing in UI (e.g. updates) it must be in main thread.
class BKThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        
        // Add into background thread. use self is to reference to the BKThreadViewModel class
        // Then downloadData function runs on backgound thread
        
        // This is generic one to allow system allocate task to any thread that is avaiable
        //DispatchQueue.global().async
        // this is more spcific to allow system allocate task to the background thread.
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            // Check thread
            print("Check 1: \(Thread.isMainThread)")
            print("Check 2: \(Thread.current)")
            
            // Add this into main is due to this array will appear in view.
            DispatchQueue.main.async {
                self.dataArray = newData
                
                // Check thread
                print("Check 1: \(Thread.isMainThread)")
                print("Check 2: \(Thread.current)")
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BKThread: View {
    @StateObject var vm = BKThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    BKThread()
}
