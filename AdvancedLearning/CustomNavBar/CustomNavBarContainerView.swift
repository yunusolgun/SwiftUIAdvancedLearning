//
//  CustomNavBarContainerView.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 19.04.2025.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

#Preview {
    CustomNavBarContainerView {
        ZStack {
            Color.green.ignoresSafeArea()
            
            Text("Hello world")
                .foregroundStyle(.white)
                .customNavigationTitle("new title")
                .customNavigationSubtitle("subtitle")
                .customNavigationBarBackButtonHidden(true)
        }
    }
}
