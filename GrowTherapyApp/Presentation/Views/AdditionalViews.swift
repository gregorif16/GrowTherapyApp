//
//  AdditionalViews.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 21/10/24.
//

import Foundation
import SwiftUI
import DotLottie

struct SettingsView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Settings section")
                    .font(.system(size: 25))
                    .bold()
                DotLottieAnimation(webURL: "https://lottie.host/e7c4bbd9-479b-4ebd-9cb9-b28801f1f476/Ivk3qzdQVh.json", config: AnimationConfig(autoplay: true, loop: true)).view()
                    .frame(width: 300, height: 300)
                
                Spacer()
            }
        }.modifier(BackgroundViewModifier())
    }
}


struct ChatView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Chat section between users and providers")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25))
                    .bold()
                DotLottieAnimation(webURL: "https://lottie.host/bff981fc-d198-4771-a68d-b2701db857e6/E9Fnia5qD0.json", config: AnimationConfig(autoplay: true, loop: true)).view()
                    .frame(width: 300, height: 300)
                
                Spacer()
            }
        }.modifier(BackgroundViewModifier())
    }
}


#Preview {
    SettingsView()
}
