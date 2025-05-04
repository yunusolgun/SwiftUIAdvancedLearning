//
//  PropertyWrapperBootcamp2.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 4.05.2025.
//

import SwiftUI

@propertyWrapper
struct Capitalized: DynamicProperty {
    
    @State private var value: String
    
    var wrappedValue: String {
        get {
            value
        }
        
        nonmutating set {
            value = newValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.value = wrappedValue.capitalized
    }
}

@propertyWrapper
struct Uppercased: DynamicProperty {
    
    @State private var value: String
    
    var wrappedValue: String {
        get {
            value
        }
        
        nonmutating set {
            value = newValue.uppercased()
        }
    }
    
    init(wrappedValue: String) {
        self.value = wrappedValue.capitalized
    }
}

struct PropertyWrapperBootcamp2: View {
    
//    @Capitalized private var title: String = "Hello world"
    @Uppercased private var title: String = "Hello world"
    
    var body: some View {
        VStack {
            
            Button(title) {
                title = "new title".uppercased()
            }
            
        }
    }
}

#Preview {
    PropertyWrapperBootcamp2()
}
