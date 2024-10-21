//
//  EmotionRatingView.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import Foundation
import SwiftUI
import DotLottie


struct EmotionRatingView: View {
    @ObservedObject var viewModel: TaskViewModel
    @Binding var path: [Task]
    
    var body: some View {
        VStack {
            Text("Rate your emotions")
                .font(.title)
            VStack {
                EmotionAnimation()
                Text("After every session the users can track their emotions in this section")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .bold()
                    .padding()
            }
                
            Spacer()
            Button {
                path.removeAll()
            } label: {
                Text("Submit")
                    .font(.title2)
                    .frame(width: 350, height: 50)
                    .background(.cyan)
                    .cornerRadius(12)
            }
        }
        .modifier(BackgroundViewModifier())
        .padding()
    }
}
    
    struct EmotionAnimation: View {
        var body: some View {
            VStack {
                DotLottieAnimation(webURL: "https://lottie.host/9baa18d1-2a92-43ec-b867-b578b23156b3/VdJFVj3zGf.json", config: AnimationConfig(autoplay: true, loop: true)).view()
                    .frame(width: 360, height: 360)
            }
        }
}

