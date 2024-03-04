//
//  CombineFramework.swift
//  UIElements
//
//  Created by Tony Chen on 1/3/2024.
//

import SwiftUI
import Combine

struct newDataModel: Identifiable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class CombineViewModel: ObservableObject {
    @Published var posts: [newDataModel] = []
    var cancelables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // Create publisher
        URLSession.shared.dataTaskPublisher(for: url)
            //subscribe dataTaskPublisher to background thread. This should be done automatically
            //.subscribe(on: DispatchQueue.global(qos: .background))
            // Receive on main thread to update data on UI
            .receive(on: DispatchQueue.main)
            // Verify Data is good
            .tryMap(handleOutput)
            // Decode data into data model
            .decode(type: [newDataModel].self, decoder: JSONDecoder())
            // If no error should be worried, it can use below
//            .replaceError(with: [])
//            .sink(receiveValue: { [weak self] returnData in
//                self?.posts = returnData
//            })
        
            // Put the data into app
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] returnData in
                self?.posts = returnData
            }
            // Cancel subscription of needed
            .store(in: &cancelables)
    }
    
    func handleOutput(outPut: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = outPut.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return outPut.data
    }
    
}

struct CombineFramework: View {
    @StateObject var vm = CombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.title)
                    Text(post.body)
                        .font(.headline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    CombineFramework()
}
