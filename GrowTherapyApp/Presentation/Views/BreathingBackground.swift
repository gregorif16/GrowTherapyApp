//
//  BreathingBackground.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import SwiftUI

struct BreathingBackgroundViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            ZStack(alignment: .center) {
                Color.white.ignoresSafeArea()
                Color.black.ignoresSafeArea()
                    .opacity(0.2)
                Circle()
                    .fill(.purple.opacity(1))
                    .frame(width: 320, height: 320)
                    .blur(radius: 128)
                    .offset(x: -128, y: 144)
                
                Rectangle()
                    .fill(.blue.opacity(1))
                    .frame(width: 320, height: 320)
                    .blur(radius: 128)
                    .offset(x: 144, y: -128)
                Circle()
                    .fill(.purple.opacity(1))
                    .frame(width: 320, height: 320)
                    .blur(radius: 128)
                    .offset(x: 128, y: -144)
                
                content
                    .padding()
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }


#Preview {
    BreathingBackgroundViewModifier() as! any View
}
