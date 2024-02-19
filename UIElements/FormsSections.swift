//
//  FormsSections.swift
//  UIElements
//
//  Created by Tony Chen on 31/1/2024.
//

import SwiftUI

class FormViewModal: ObservableObject {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var passowrdAgain: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var postalCode: String = ""
    @State var country: String = ""
}

struct FormsSections: View {

    @StateObject var viewModel = FormViewModal()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("First name", text: $viewModel.firstName)
                        TextField("Last name", text: $viewModel.lastName)
                    }
                    Section(footer: Text("Your password must be at least 8 characters long.")) {
                        SecureField("Create password", text: $viewModel.password)
                        SecureField("Confirm password", text: $viewModel.passowrdAgain)
                    }
                    Section(header: Text("Mailling address")) {
                        TextField("Street address", text: $viewModel.address)
                        TextField("City", text: $viewModel.city)
                        TextField("State", text: $viewModel.state)
                        TextField("Postal Code", text: $viewModel.postalCode)
                        TextField("Country", text: $viewModel.country)
                    }
                }
                Button(action: {
                    
                }, label: {
                    Text("Continue")
                        .frame(width: 200,
                                height: 50,
                               alignment: .center)
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                })
                .padding()
            }
            .navigationTitle("Create Account")
        }
    }
}

#Preview {
    FormsSections()
}
