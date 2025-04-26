//
//  FeaturesBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 26.04.2025.
//

import SwiftUI
import Combine


// download with Combine
// download with @escaping closure
// convert @escaping closure to Combine

class FeaturesBootcampViewModel: ObservableObject {
    
    @Published var title: String = "Starting title"
    let url = URL(string: "https://www.google.com")!
    var cancellables = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    func download() {
//        getCombinePublisher()
        getFeaturePublisher()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedValue in
                self?.title = returnedValue
            }
            .store(in: &cancellables)
        
        
//        getEscapingClosure { [weak self] returnedValue, error in
//            self?.title = returnedValue
//        }

    }
    
    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map({ _ in
                return "New value"
            })
            .eraseToAnyPublisher()
    }
    
    func getEscapingClosure(completionHandler: @escaping (_ value: String, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler("new value 2", nil)
        }
        .resume()
    }
    
    
    func getFeaturePublisher() -> Future<String, Error> {
        return Future { promise in
            self.getEscapingClosure { returnedValue, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(returnedValue))
                }
            }
        }
    }
    
}

struct FeaturesBootcamp: View {
    
    @StateObject private var vm = FeaturesBootcampViewModel()
    
    var body: some View {
        Text(vm.title)
    }
}

#Preview {
    FeaturesBootcamp()
}
