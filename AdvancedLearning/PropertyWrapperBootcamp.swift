//
//  PropertyWrapperBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 2.05.2025.
//

import SwiftUI

extension FileManager {
    static func documentsPath(key: String) -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appending(path: "\(key).txt")
    }
}

@propertyWrapper
struct FileManagerProperty: DynamicProperty {
    @State private var title: String
    let key: String
    
    var wrappedValue: String {
        get { title }
        nonmutating set { save(newValue: newValue) }
    }
    
    init(wrappedValue: String, _ key: String) {
        self.key = key
        do {
            title = try String(contentsOf: FileManager.documentsPath(key: key), encoding: .utf8)
            print("Success Read")
        } catch {
            title = wrappedValue
            print("Error Read: \(error)")
        }
    }
    

    
    func save(newValue: String) {
        do {
            try newValue.write(to: FileManager.documentsPath(key: key), atomically: false, encoding: .utf8)
            title = newValue
//            print(NSHomeDirectory())
            print("Success saved")
        } catch  {
            print("error saving: \(error)")
            
        }
       
    }
}

struct PropertyWrapperBootcamp: View {
    
    @FileManagerProperty("custome_title_1")  private var title: String = "Start text"
    @FileManagerProperty("custome_title_2")  private var title2: String = "Start text 2"
    @FileManagerProperty("custome_title_3")  private var title3: String = "Start text 3"
//    @FileManagerProperty private var title: String
//    var fileManagerProperty = FileManagerProperty()
//    @State private var title: String = "Starting title"
    
    var body: some View {
        VStack(spacing: 40) {
            Text(title).font(.largeTitle)
            Text(title2).font(.largeTitle)
            Text(title3).font(.largeTitle)
            
            Button("Click me 1") {
                title = "title 1"
            }
            Button("Click me 2") {
                title = "title 2"
                title2 = "some random title"
            }
        }
        
    }
    

    
    

}

#Preview {
    PropertyWrapperBootcamp()
}
