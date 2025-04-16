//
//  CustomCurvesBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 16.04.2025.
//

import SwiftUI

struct CustomCurvesBootcamp: View {
    var body: some View {
        ArcSample()
            .stroke(lineWidth: 5)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    CustomCurvesBootcamp()
}


struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path
                .addArc(
                    center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.height / 2,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 40),
                    clockwise: true
                )
        }
    }
}



