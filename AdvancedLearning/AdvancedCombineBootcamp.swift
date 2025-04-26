//
//  AdvancedCombineBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 25.04.2025.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    
    //@Published var basicPublisher: String = "first publish"
    //let currentValuePublisher = CurrentValueSubject<String, Error>("first publish")
    let passThroughPublisher = PassthroughSubject<Int, Never>()
    
    init () {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items: [Int] = [1,2,3,4,5,6,7,8,9,10]
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
//                self.currentValuePublisher.send(items[x])
                //self.basicPublisher = items[x]
                
                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
                
            }
        }
        
    }
}

class AdvancedCombineBootcampViewModel: ObservableObject {
    
    @Published var data: [String] = []
    @Published var error: String = ""
    
    let dataService = AdvancedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.passThroughPublisher
        
        // Sequence Operations
//            .first()
//            .first(where: { $0 > 4 })
//            .tryFirst(where: { int in
//                if int == 3 {
//                    throw URLError(.badServerResponse)
//                }
//                return int > 1
//            })
//            .last()
//            .last(where: {$0 < 4})
//            .tryLast(where: { int in
//                if int == 3 {
//                    throw URLError(.badServerResponse)
//                }
//                return int > 13
//            })
//            .dropFirst()
//            .dropFirst(3)
//            .drop(while: { $0 < 3})
//            .tryDrop(while: { int in
//                if int == 15 {
//                    throw URLError(.badServerResponse)
//                }
//                return int < 6
//            })
//            .prefix(3)
//            .prefix(while: {$0 < 5})
//            .output(at: 5)
//            .output(in: 2..<4)
        
        
        // Mathmatic Operations
//            .max()
//            .max(by: { int1, int2 in
//                return int1 < int2
//            })
//            .min()
            
        
        // Filter / Reducing Operations
//            .map({ String($0) })
//            .tryMap({ int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return String(int)
//            })
//            .compactMap({ int in
//                if int == 5 {
//                    return nil
//                }
//                return String(int)
//            })
//            .filter({ ($0 > 3) && ($0 < 7) })
//            .removeDuplicates()
//            .replaceNil(with: 5)
//            .replaceEmpty(with: [])
//            .replaceError(with: "default value")
//            .scan(0, { existingValue, newValue in
//                return existingValue + newValue
//            })
//            .scan(0, {$0 + $1})
//            .scan(0, +)
//            .reduce(0, { existingValue, newValue in
//                return existingValue + newValue
//            })
//            .reduce(0, +)
//            .allSatisfy({ $0 < 50 })
//                    .collect()
//                    .collect(3)
        
      
        // Timing Operations
//            .debounce(for: 1, scheduler: DispatchQueue.main)
//            .delay(for: 2, scheduler: DispatchQueue.main)
//            .measureInterval(using: DispatchQueue.main)
//            .throttle(for: 7, scheduler: DispatchQueue.main, latest: true)
//            .retry(3)
//            .timeout(0.75, scheduler: DispatchQueue.main)
        
        
        
        
            .map({ String($0) })

            
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "ERROR: \(error.localizedDescription)"
                }
            } receiveValue: { [weak self] returnedValue in
//                self?.data.append(contentsOf: returnedValue)
//                self?.data = returnedValue
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)

        
    }
    
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject private var vm = AdvancedCombineBootcampViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.data, id: \.self) {
                    Text($0)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                if !vm.error.isEmpty {
                    Text(vm.error)
                }
            }
        }
    }
}

#Preview {
    AdvancedCombineBootcamp()
}
