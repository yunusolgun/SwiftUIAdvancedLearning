//
//  ViewModifierBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 15.04.2025.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Hello, World!")
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .orange)
            
            
            Text("Hello, Everyone!")
                .font(.subheadline)
                .withDefaultButtonFormatting()

            
            Text("Hello")
                .font(.title)
                .modifier(DefaultButtonViewModifier(backgroundColor: .red))

            
        }
        .padding()
    }
}

#Preview {
    ViewModifierBootcamp()
}
