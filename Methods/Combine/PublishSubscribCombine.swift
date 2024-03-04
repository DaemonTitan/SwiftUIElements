//
//  PublishSubscribCombine.swift
//  UIElements
//
//  Created by Tony Chen on 3/3/2024.
//

import SwiftUI
import Combine

class PSViewModel: ObservableObject {
    @Published var countNumber: Int = 0
    @Published var addText = ""
    @Published var textIsValid: Bool = false
    @Published var showButton: Bool = false

    
    // An array that stores list of publiser used for cancel subscribe
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        textFieldScribe()
        countNumberUp()
        buttonScribe()
    }
    
    func countNumberUp() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }
                self.countNumber += 1
            })
            .store(in: &cancellables)
    }
    
    func textFieldScribe() {
        $addText
        // common used in Textfield in searching. If map has complex logic, use debounce
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                if  text.count > 3 {
                    return true
                } else {
                    return false
                }
            }
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func buttonScribe() {
        $textIsValid
            .combineLatest($countNumber)
            .sink { [weak self] isValid, count in
                guard let self = self else { return }
                if isValid && count > 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct PublishSubscribCombine: View {
    @StateObject private var psViewModel = PSViewModel()
    
    var body: some View {
        VStack {
            Text("\(psViewModel.countNumber)")
                .font(.title)
            
            Text(psViewModel.textIsValid.description)
            
            TextField("Add Text...", text: $psViewModel.addText)
                .padding(.leading)
                .frame(height: 55)
                .background(Color.gray)
                .foregroundStyle(.white)
                .overlay (
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(
                                psViewModel.addText.count < 1 ? 0.0 :
                                psViewModel.textIsValid ? 0.0 : 1.0)
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(psViewModel.textIsValid ? 1.0 : 0.0)
                    }
                    .font(.headline)
                    .padding(.trailing)
                    , alignment: .trailing
                )
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .opacity(psViewModel.showButton ? 1.0 : 0.5)
            }
            .disabled(!psViewModel.showButton)
        }
    }
}

#Preview {
    PublishSubscribCombine()
}
