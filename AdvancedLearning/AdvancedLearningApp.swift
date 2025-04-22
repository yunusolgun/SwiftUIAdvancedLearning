//
//  AdvancedLearningApp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 15.04.2025.
//

import SwiftUI

@main
struct AdvancedLearningApp: App {
    var body: some Scene {
        WindowGroup {
            let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
            DependencyInjectionBootcamp(dataService: dataService)
        }
    }
}
