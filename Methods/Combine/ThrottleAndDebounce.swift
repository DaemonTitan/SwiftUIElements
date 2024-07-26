//
//  ThrottleAndDebounce.swift
//  UIElements
//
//  Created by Tony Chen on 26/7/2024.
//

import SwiftUI

class ThrottleDebounceViewModel: ObservableObject {
    @Published var throttleUserInput = ""
    @Published var throttleExecutionTimes = 0
    
    @Published var debounceUserInput = ""
    @Published var debounceExecutionTimes = 0
}

struct ThrottleAndDebounce: View {
    @StateObject var viewModel = ThrottleDebounceViewModel()
    
    var body: some View {
        VStack {
            // Throttle
            Form {
                Text("Throttle")
                TextField("User input", text: $viewModel.throttleUserInput)
                Text("Num. code executions: \(viewModel.throttleExecutionTimes)")
                
                Button(action: {
                    viewModel.throttleExecutionTimes = 0
                }, label: {
                    Text("Reset count")
                })
            }
            .onReceive(
                viewModel.$throttleUserInput.throttle(for: 1,
                                              scheduler: RunLoop.main,
                                              latest: true),
                perform: { searchTerm in
                    viewModel.throttleExecutionTimes += 1
            })
            
            // Debounce
            Form {
                Text("Debounce")
                TextField("User input", text: $viewModel.debounceUserInput)
                Text("Num. code executions: \(viewModel.debounceExecutionTimes)")
                
                Button(action: {
                    viewModel.debounceExecutionTimes = 0
                }, label: {
                    Text("Reset count")
                })
            }
            .onReceive(
                viewModel.$debounceUserInput.debounce(for: 1, scheduler: RunLoop.main),
                perform: { searchTerm in
                    viewModel.debounceExecutionTimes += 1
            })
        }
    }
}



#Preview {
    ThrottleAndDebounce()
}
