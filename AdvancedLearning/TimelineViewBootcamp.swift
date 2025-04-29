//
//  TimelineViewBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 29.04.2025.
//

import SwiftUI

struct TimelineViewBootcamp: View {
    
    @State private var startTime: Date = .now
    @State private var pauseAnimation: Bool = false
    
    var body: some View {
        VStack {
            TimelineView(.animation(minimumInterval: 1, paused: pauseAnimation)) { context in
                Text("\(context.date.timeIntervalSince1970)")
                
//                let seconds = Calendar.current.component(.second, from: context.date)
                let seconds = context.date.timeIntervalSince(startTime)
                Text("\(seconds)")
                
                if context.cadence == .live {
                    Text("Cadence: LIVE")
                } else if context.cadence == .minutes {
                    Text("Cadence: MINUTES")
                } else if context.cadence == .seconds {
                    Text("Cadence: SECONDS")
                }
                
                Rectangle()
                    .frame(width: seconds < 10 ? 50: seconds < 30 ? 200: 400,
                           height: 100)
                    .animation(.bouncy, value: seconds)
            }
            
            Button(pauseAnimation ? "PLAY" : "PAUSE") {
                pauseAnimation.toggle()
            }
            
        }
    }
}

#Preview {
    TimelineViewBootcamp()
}
