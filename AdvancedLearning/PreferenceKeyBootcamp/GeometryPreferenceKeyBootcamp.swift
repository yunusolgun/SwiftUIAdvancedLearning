//
//  GeometryPreferenceKeyBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 18.04.2025.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            Spacer()
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                        .overlay(
                            Text("\(geo.size.width)").foregroundStyle(.white)
                        )
                }
                
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
            self.rectSize = value
        }
    }
}

#Preview {
    GeometryPreferenceKeyBootcamp()
}

extension View {
    
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        self
            .preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
