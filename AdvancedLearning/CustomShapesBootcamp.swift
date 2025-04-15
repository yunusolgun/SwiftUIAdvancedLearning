//
//  CustomShapesBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 15.04.2025.
//

import SwiftUI

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
        }
    }
    
    
}

struct CustomShapesBootcamp: View {
    var body: some View {
        ZStack {
            Triangle()
                .frame(width: 300, height: 300)
        }
    }
}

#Preview {
    CustomShapesBootcamp()
}
