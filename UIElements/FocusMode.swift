//
//  FocusMode.swift
//  UIElements
//
//  Created by Tony Chen on 6/2/2024.
//

import SwiftUI

struct FocusMode: View {
    
    enum onboarindFields: Hashable {
        case userName
        case password
    }
    
    @State var userName: String = ""
    @State var password: String = ""
    @FocusState var userNameFocus: Bool
    
    @FocusState var fieldInFocus: onboarindFields?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add your name...", text: $userName)
                //.focused($userNameFocus)
                .focused($fieldInFocus, equals: .userName)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .submitLabel(.continue)
                .onSubmit {
                    print("Submit form")
                }
            
            SecureField("Add your password...", text: $password)
                //.focused($passwordFocus)
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button(action: {
                userNameFocus.toggle()
            }, label: {
                Text("Button")
            })
            
            Button(action: {
                let userNameValid = !userName.isEmpty
                let passwordValid = !password.isEmpty
                
                if userNameValid && passwordValid {
                    print("Sign up")
                } else if userNameValid {
                    fieldInFocus = .password
//                    userNameFocus = false
//                    passwordFocus = true
                } else {
                    fieldInFocus = .userName
//                    userNameFocus = true
//                    passwordFocus = false
                }
            }, label: {
                Text("Sign up")
            })
        }
        .padding(40)
//        .onAppear(perform: {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.userNameFocus = true
//            }
//        })
    }
}

#Preview {
    FocusMode()
}
