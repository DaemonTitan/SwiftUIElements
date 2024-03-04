//
//  EscaptingClosure.swift
//  UIElements
//
//  Created by Tony Chen on 29/2/2024.
//

import SwiftUI

class EscapingViewMode: ObservableObject {
    @Published var text: String = "Start now"
    
    func getData() {
//        downloadData3 {  [weak self] returnedData in
//            self?.text = returnedData
//        }
        
//        downloadData4 { [weak self] result in
//            self?.text = result.data
//        }
        
        downloadData5 { [weak self] result in
            self?.text = result.data
        }
    }
    
    // synchronize code which will run line by line
    func downloadData() -> String {
        return "New data"
    }
    
    // Run into error which method is synchronize and can't be delaied.
//    func downloadData2() -> String {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            return "New Data 2"
//        }
//    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New Data 2")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New Data 3")
        }
    }
    
    func downloadData4(completionHandler: @escaping ( DownloadResult ) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New Data 4")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New Data 5")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = ( DownloadResult ) -> ()

struct EscaptingClosure: View {
    
    @StateObject var escapViewModel = EscapingViewMode()
    
    var body: some View {
        Text(escapViewModel.text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                escapViewModel.getData()
            }
    }
}

#Preview {
    EscaptingClosure()
}
