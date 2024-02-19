//
//  Models.swift
//  UIElements
//
//  Created by Tony Chen on 1/2/2024.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID()
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified:Bool
}

struct Models: View {
    @State var users = [
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 5, isVerified: true),
        UserModel(displayName: "Michael", userName: "Mich12", followerCount: 100, isVerified: true),
        UserModel(displayName: "Tony", userName: "Doglover", followerCount: 300, isVerified: false),
        UserModel(displayName: "Chris", userName: "ChrisDog", followerCount: 20, isVerified: true)
    ]
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 10)
                    
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

#Preview {
    Models()
}
