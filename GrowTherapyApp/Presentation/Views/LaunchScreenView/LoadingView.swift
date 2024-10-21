//
//  SplashView.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 20/10/24.
//

import SwiftUI
import DotLottie

struct LoadingView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                DotLottieAnimation(webURL: "https://lottie.host/c7a7f010-97f8-4871-82c0-6b2d5ff54037/OlAgGJ8CM2.json", config: AnimationConfig(autoplay: true, loop: true)).view()
                    .frame(width: 150, height: 150)
                Text("Grow Therapy")
                    .font(.system(size: 25))
                    .bold()
                Spacer()
            }
        }.modifier(BackgroundViewModifier())
    }
}

#Preview {
    LoadingView()
}
