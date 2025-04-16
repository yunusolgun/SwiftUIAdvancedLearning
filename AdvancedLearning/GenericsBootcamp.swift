//
//  GenericsBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 16.04.2025.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        return GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello world")
    
    @Published var genericStringModel = GenericModel(info: "helloo")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            Text(vm.stringModel.info ?? "no data")
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
            
                
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    GenericsBootcamp()
}
