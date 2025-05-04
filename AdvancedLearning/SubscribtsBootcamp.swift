//
//  SubscribtsBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 4.05.2025.
//

import SwiftUI

extension Array where Element == String {
    subscript(value: String) -> Element? {
        self.first(where: { $0 == value })
    }
}

struct SubscribtsBootcamp: View {
    
    @State private var myArray: [String] = ["one", "two", "three"]
    @State private var selectedItem: String? = nil
    
    var body: some View {
        VStack {
            ForEach(myArray, id: \.self) { string in
                Text(string)
            }
            
            Text("SELECTED: \(selectedItem ?? "NONE")")
        }
        .onAppear {
//            selectedItem = myArray[0]
            
            selectedItem = myArray["one"]
        }
    }
}

#Preview {
    SubscribtsBootcamp()
}
