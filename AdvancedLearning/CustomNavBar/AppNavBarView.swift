//
//  AppNavBarView.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 19.04.2025.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination:
                                Text("Destination")
                    .customNavigationTitle("Second screen")
                    .customNavigationSubtitle("Subtitle should be showing")
                ) {
                    Text("Navigate")
                }

            }
            .customNavBarItems(title: "new title", subtitle: "subtitle", backButtonHidden: true)
//            .customNavigationTitle("Custom title")
//            .customNavigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    AppNavBarView()
}


extension AppNavBarView {
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav title")
        }
    }
}
