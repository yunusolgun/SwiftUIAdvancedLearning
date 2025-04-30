//
//  KeypathsBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 30.04.2025.
//

import SwiftUI

struct MyDataModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let count: Int
    let date: Date
}

extension Array where Element == MyDataModel {
    func customSorted() -> [MyDataModel] {
        self.sorted { item1, item2 in
            return item1.count < item2.count
        }
    }
}


struct KeypathsBootcamp: View {
    
//    @Environment(\.dismiss) var dismiss
    @AppStorage("user_count") var userCount: Int = 0
    @State private var screenTitle: String = ""
    
    @State private var dataArray: [MyDataModel] = []
    
    var body: some View {
        List {
            ForEach(dataArray) { item in
                VStack(alignment: .leading) {
                    Text(item.id)
                    Text(item.title)
                    Text("\(item.count)")
                    Text(item.date.description)
                }
                .font(.headline)
            }
        }
      
            .onAppear {
                let array = [
                    MyDataModel(title: "Three", count: 3, date: .distantFuture),
                    MyDataModel(title: "One", count: 1, date: .now),
                    MyDataModel(title: "Two", count: 2, date: .distantPast),
                   
                ]
                
//                let newArray = array.sorted { $0.count < $1.count }
//                let newArray = array.sorted { item1, item2 in
//                    return item1[keyPath: \.count] < item2[keyPath: \.count]
//                }
                
                let newArray = array.customSorted()
                
                dataArray = newArray
                
//                let title = item.title
//                let title2 = item[keyPath: \.title]
//                screenTitle = title2
                
            }
    }
}

#Preview {
    KeypathsBootcamp()
}
