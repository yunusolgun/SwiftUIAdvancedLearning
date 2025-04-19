//
//  AppTabBarView.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 19.04.2025.
//

import SwiftUI


// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect


struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            
            Color.blue
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            
            
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

#Preview {
   
    AppTabBarView()
}


extension AppTabBarView {
    
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
