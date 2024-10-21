//
//  CustomAlert.swift
//  UIElements
//
//  Created by Tony Chen on 21/10/2024.
//

import SwiftUI

protocol CustomErrorAlert {
    var title: String { get }
    var subtitle: String { get }
    var buttons: AnyView { get }
}

extension View {
    func showCustomAlert(binding: Binding<Bool>, customError: CustomError) -> some View {
        self.alert(isPresented: binding, error: customError) { error in
            error.buttonAlert()
        } message: { error in
            Text(error.failureReason ?? "Error")
        }
    }
    
    
    func genericCustomAlert<T: CustomErrorAlert & LocalizedError>(binding: Binding<Bool>, error: T?) -> some View {
                self.alert(isPresented: binding, error: error) { error in
                    error.buttons
                } message: { error in
                    Text(error.title)
                }
    }
}

struct CustomAlert: View {
    
    @State private var error: Error? = nil
    @State private var customError: CustomError? = nil
    @State var newCustomError: CustomError?
    
    @State private var showError1: Bool = false
    @State private var showError2: Bool = false
    @State private var showError3: Bool = false
    @State private var showError4: Bool = false
    
    var body: some View {
        
        Button(action: {
            customError1()
        }, label: {
            Text("Custom Error 1")
        })
        .padding()
        .alert(error?.localizedDescription ?? "Error", isPresented: $showError1) {
            Button(action: {
               
            }, label: {
                Text("Ok")
            })
        }
        
        Button(action: {
            customError2()
        }, label: {
            Text("Custom Error 2")
        })
        .padding()
        .alert(isPresented: $showError2, error: customError) { error in
            error.buttonAlert()
        } message: { error in
            Text(error.failureReason ?? "Error")
        }

        Button(action: {
            customError3()
        }, label: {
            Text("Custom Error 3")
        })
        .padding()
        .showCustomAlert(binding: $showError3, customError: newCustomError ?? .dataLoadError)
        
        Button(action: {
            customError4()
        }, label: {
            Text("Custom Error 4")
        })
        .padding()
        .genericCustomAlert(binding: $showError4, error: newCustomError)
        
    }
}

extension CustomAlert {
    
    private func customError1() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            
        } else {
            let customError: Error = CustomError.urlError(error: URLError(.badURL))
            error = customError
            showError1.toggle()
        }
    }
    
    
    private func customError2() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            
        } else {
            customError = CustomError.noInternetconnection(buttonPressed: {
                
            }, retryPressed: {
                
            })
            showError2.toggle()
        }
    }
    
    private func customError3() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            
        } else {
            customError = CustomError.noInternetconnection(buttonPressed: {
                
            }, retryPressed: {
                
            })
            showError2.toggle()
        }
    }
    
    private func customError4() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            
        } else {
            customError = CustomError.dataNotFound
            showError2.toggle()
        }
    }
}

// For custom error, create a enum and conform to Error potocol and localizedError
enum CustomError: Error, LocalizedError, CustomErrorAlert {
    case dataLoadError
    case noInternetconnection(buttonPressed: () -> Void, retryPressed: () -> Void)
    case dataNotFound
    case urlError(error: Error)
    
    var title: String {
        switch self {
        case .dataLoadError:
            "Fail to load data"
        case .noInternetconnection:
            "Fail to connect to Internet"
        case .dataNotFound:
            "Fail to load data"
        case .urlError(error: let error):
            "Error: \(error.localizedDescription)"
        }
    }
    
    var subtitle: String {
        switch self {
        case .dataLoadError:
            "Close app to reload data"
        case .noInternetconnection:
            "Please  check internet connection"
        case .dataNotFound:
            "Error to loading data"
        case .urlError(error: let error):
            "Error: \(error.localizedDescription)"
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .dataLoadError:
            "Fail to load data"
        case .noInternetconnection:
            "Fail to connect to Internet"
        case .dataNotFound:
            "Fail to load data"
        case .urlError(error: let error):
            "Error: \(error.localizedDescription)"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .dataLoadError:
            "Close app to reload data"
        case .noInternetconnection:
            "Please  check internet connection"
        case .dataNotFound:
            "Error to loading data"
        case .urlError(error: let error):
            "Error: \(error.localizedDescription)"
        }
    }
    
    var buttons: AnyView {
        AnyView(buttonAlert())
    }
    
    @ViewBuilder func buttonAlert() -> some View {
        switch self {
        case .noInternetconnection(buttonPressed: let buttonPressed,
                                   retryPressed: let retryPressed):
            Button(action: {
               buttonPressed()
            }, label: {
                Text("Ok")
            })
            
            Button(action: {
                retryPressed()
            }, label: {
                Text("Retry")
            })
        case .dataNotFound:
            Button(action: {
               
            }, label: {
                Text("Retry")
            })
        default:
            Button(role: .destructive, action: {
               
            }, label: {
                Text("Delete")
            })
        }
    }
}



#Preview {
    CustomAlert()
}
