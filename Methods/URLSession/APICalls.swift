//
//  APICalls.swift
//  UIElements
//
//  Created by Tony Chen on 1/3/2024.
//

import SwiftUI

struct DataModel: Identifiable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class APICallsViewModel: ObservableObject {
    @Published var posts:[DataModel] = []
    
    init() {
        downloadData()
    }
    
    func downloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        getAPICall(formURL: url) { data in
            if let data = data {
                guard let newPosts = try? JSONDecoder().decode([DataModel].self, from: data) else {return}
                // Move it to the main thread and use weak reference. 
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("No data returned")
            }
        }
    }
    // For iOS 13 or older
    func getAPICall(formURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("No data \(String(describing: error?.localizedDescription))")
                // This is the ensure even it returns Error, it still run the completionHandler. So system knows it try to get data, but failed.
                completionHandler(nil)
                return
            }
            completionHandler(data)
        }.resume()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        // dataTask runs in the background Thread automatically.
        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else  {
//                print("No data")
//                return
//            }
//            guard error == nil else {
//                print("\(String(describing: error))")
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else {
//                print("Invalid response")
//                return
//            }
//
//            guard response.statusCode >= 200 && response.statusCode < 300 else {
//                print("Status code should be 2xx, but is \(response.statusCode)")
//                return
//            }
            
            guard let data = data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("No data \(error?.localizedDescription)")
                return
            }
            
            print("Data Downloaded")
            print(data)
            
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
            guard let newPost = try? JSONDecoder().decode(DataModel.self, from: data) else {return}
            // Move it to the main thread and use weak reference
            DispatchQueue.main.async { [weak self] in
                self?.posts.append(newPost)
            }
        }.resume()
    }
}

struct APICalls: View {
    
    @StateObject var vm = APICallsViewModel()
    
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
    APICalls()
}
