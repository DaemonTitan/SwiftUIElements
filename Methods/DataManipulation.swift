//
//  DataManipulation.swift
//  UIElements
//
//  Created by Tony Chen on 28/2/2024.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ViewModelModification: ObservableObject {
    @Published var userArray: [User] = []
    @Published var sortArray: [User] = []
    @Published var filterArray: [User] = []
    @Published var mapArray: [String] = []
    @Published var complexFilterArray: [String] = []
    
    init() {
        getUser()
        sortFilter()
        pointsFilter()
        mapFilter()
        complexFilter()
    }
    
    func getUser() {
        let user1 = User(name: "Tom", points: 10, isVerified: true)
        let user2 = User(name: "Nick", points: 20, isVerified: false)
        let user3 = User(name: "Smith", points: 100, isVerified: false)
        let user4 = User(name: "Michael", points: 105, isVerified: true)
        let user5 = User(name: "Alan", points: 50, isVerified: false)
        let user6 = User(name: "Dan", points: 42, isVerified: true)
        let user7 = User(name: "Frank", points: 89, isVerified: true)
        let user8 = User(name: "Elle", points: 67, isVerified: false)
        let user9 = User(name: "Bob", points: 91, isVerified: true)
        
        self.userArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9
        ])
    }
    
    
    func sortFilter() {
        sortArray = userArray.sorted(by: { $0.points > $1.points })
//        sortArray = userArray.sorted { user1, user2 in
//            return user1.points > user2.points
//        }
        
    }
    
    func pointsFilter() {
        filterArray = userArray.filter({ $0.points > 50 })
//        filterArray = userArray.filter({ user in
//            return user.points > 50
//            return user.isVerified
//            return user.name.contains("F")
//        })
    }

    func mapFilter() {
        //mapArray = userArray.map({ $0.name ?? "" })
//        mapArray = userArray.map({ user -> String in
//            return user.name ?? "Error"
//        })
        
//        mapArray = userArray.compactMap({ $0.name })
//        mapArray = userArray.compactMap({ user -> String? in
//            return user.name
//        })
    }
    
    func complexFilter() {
        complexFilterArray = userArray
                                .sorted(by: { $0.points > $1.points })
                                .filter({ $0.isVerified })
                                .compactMap({ $0.name })
            
    }
}

struct DataManipulation: View {
    @StateObject var userViewModel = ViewModelModification()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(userViewModel.filterArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        HStack {
                            Text("Pints: \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                                    .foregroundStyle(Color.white)
                            }
                            
                        }
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
                    .padding(.horizontal)
                    .shadow(radius: 10)
                }
            }
        }
    }
}

struct UserFilter: View {
    @StateObject var userViewModel1 = ViewModelModification()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(userViewModel1.mapArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    DataManipulation()
    //UserFilter()
}
