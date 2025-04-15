//
//  MatchedGeometryEffectBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 15.04.2025.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
                    
            }
            
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
                    
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation {
                isClicked.toggle()
            }
        }
    }
}

#Preview {
    MatchedGeometryEffectExample2()
}


struct MatchedGeometryEffectExample2: View {
    let categories: [String] = ["Animals", "Food", "Travel"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                    }
                    
                    Text(category)
                        .foregroundStyle(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
