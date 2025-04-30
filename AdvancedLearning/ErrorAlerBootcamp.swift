//
//  ErrorAlerBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 29.04.2025.
//

import SwiftUI

struct ErrorAlerBootcamp: View {
    
    @State private var error: Error? = nil
    
    var body: some View {
        Button("Click Me") {
            saveData()
        }
        .alert(error?.localizedDescription ?? "Error", isPresented: Binding(value: $error)) {
            Button("OK") {
                
            }
        }
        

    }
    
    enum MyCustomError: Error, LocalizedError {
        case noInternetConnection
        case dataNotFound
        case urlError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .noInternetConnection:
                return "Please check your internet connection and try again"
            case .dataNotFound:
                return "There was an error loading data, please try again later"
            case .urlError(error: let error):
                return "Error: \(error.localizedDescription)"
            }
        }

    }
    
    private func saveData() {
        
        let isSuccessfull = false
        
        if isSuccessfull {
            
        } else {
//            let myError: Error = URLError(.badURL)
            let myError: Error = MyCustomError.noInternetConnection
            
            error = myError

        }
        
    }
}

#Preview {
    ErrorAlerBootcamp()
}
