//
//  PreferenceKeyBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 18.04.2025.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text: String = "Hello world"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation title")
                    
            }
            
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
       
    }
}

#Preview {
    PreferenceKeyBootcamp()
}

extension View {
    func customTitle(_ text: String) -> some View {
        self
            .preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}


struct SecondaryScreen: View {
    
    let text : String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear {
                getDataFromDatabase()
            }
            .customTitle(newValue)
    }
    
    func getDataFromDatabase() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newValue = "New value from databasae"
        }
    }
}


struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
